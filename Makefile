NAME		=	glfwwrapper
VERSION		=	1.0.0
ENV			=	

PACKAGES	=	tbaricault_images	\
				tbaricault_math

TARGETS		=	glew32				\
				glfw3				\
				opengl32			\
				tbaricault::images	\
				tbaricault::math

SRC			=	Clipboard	\
				Cursor		\
				Keyboard	\
				Monitor		\
				Time		\
				utils		\
				Window

all: build

configure:
	@cmake							\
		-B build 					\
		-DNAME="$(NAME)"			\
		-DVERSION="$(VERSION)"		\
		-DENV="$(ENV)"				\
		-DPACKAGES="$(PACKAGES)"	\
		-DTARGETS="$(TARGETS)"		\
		-DSRC="$(SRC)"

build: configure
	@cmake --build build

clean:
	@rm -dfr build

re: clean build

install: build
	@cmake --install build
	@cmake -P cmake/generate_uninstall.cmake

uninstall:
	@cmake -P uninstall.cmake
	@rm -f uninstall.cmake

reinstall: uninstall install

.PHONY: all configure build clean re install uninstall reinstall
