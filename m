Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05340C369A2
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 10:56:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2T5t-0001yY-Ow; Wed, 09 Apr 2025 06:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2T5r-0001vl-ID
 for qemu-riscv@nongnu.org; Wed, 09 Apr 2025 06:55:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2T5p-0000R8-JC
 for qemu-riscv@nongnu.org; Wed, 09 Apr 2025 06:55:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso44615905e9.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Apr 2025 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744196140; x=1744800940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3BFk4v3yRZCIuLOMRmgXpPW/4d1ganjv9QUzqDFqk+A=;
 b=W/u3aH4VQ4vlFn1BpfVBCsW0D0bI/UEDDgcNqmLKiS3hqvDAm5Ka4/RgjdlTnr6vfO
 E4DpDfkuOTUwZGQeUfAEYar1qf+Ru6ErZhekYCqzHPeuJ+M7wSbyZsS5Lw2psqTnlpQz
 Hfw+9Fe//DL9JoR/Ww2o+REe5dvQNgxqYp+ZAgFJ5Jd7pQe5uycOo42ZzpU7AwNNoqaF
 /RW7BEXoSALH2V1s12GvSydMxQZMEsbZuX5evvXjg8i8a2uVsr4jd+5bkWrRoA3im6Je
 WqG5YKnsBC4pAtlmgHFvvpV8oxW88/9Wy971bWF1Ca9MPZlXjQQecY8FUnbMsBs7QUza
 xxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744196140; x=1744800940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3BFk4v3yRZCIuLOMRmgXpPW/4d1ganjv9QUzqDFqk+A=;
 b=EStFzHKZaBmr0DL07VLVcZIJhgHypHkon3jWSUYwtoJ3FXFJzD5lr1BpTuE+vrOrXR
 XM5NQDMKa9mRZJzuK07vUPhfr39If2ZX5A3lCT0c8yh3G+vqsEHM3p0F2y7q/h9aegBO
 MUjAnYLtPM2lk2YGBrovcy0TA4TZVBES3fp0yPjxy270cR0uIHqZzFCjQvoMgVpyQ4d3
 dju5qosw0qJoGRLdB7uI6jAeQvBY4ZNRtQ+sOFoP5wmDgATIW5ZFnMSflByDNBU42+6T
 +vW8ct7CnbhUZ/I4gL2amoIFjBOPtUGRhwXFsAsy9YcIwGG3ZxHHTDyg79IJB4vm+KYR
 428g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQOpfTb33ORDTzt7x93xs2KIA0iM5JjMifNgElxPgQrLDBTvME0HFYt5Eaygqub7lB0Y2mrRgu5EwW@nongnu.org
X-Gm-Message-State: AOJu0Yz/TfM0EOaOTsJrOzuXfeknanycHAcwufwLnM9WFO3m22nGZRgR
 NwMFEPSFxGkvinwKHQ6j7A2eKzLHLSPiIZSHOnwt1LDD4rGz2HihRrq4wvS+ggA=
X-Gm-Gg: ASbGncvjBlJiBr0NMMUZ4YZg4V7kbEg9EtF4EGFGwX30VmN6P6YWg52GX30ezErnfTl
 +DIiRWvjC+hJKNeFXHhXlNF0jc2w0P4VEbzwyYher7XR4MCWu48MpEJljAazZ7MLkYCqr19ZiN6
 VlAxtbpCz6FAQ6idcZpIRtvtGM/5WWV0YwD1B+JT8LF51GPLqjPeSzQQ8am2FToTviFfoDo+uCd
 hnrfxTBomsnHtxNUt25AZVnMOIs67KZcsauVymX/pZdCbVJ+DcXnwL8R+Wl30ilGWyrEj/yf//z
 ffCctQth3Vw2rVMb4y/jxaI4EGsHW6j8nn4hIyyHqRg9hv/nWsSoP9GkInE85vmOuccfEraCs8V
 EzUq7atqO6Slj3iEgRZesTw==
X-Google-Smtp-Source: AGHT+IEUfJkMKdZfdrM7NVXLsDkpA0D1qnBoICGiWUV5jh2r9aTyqvHyE/THMmAErSMeQCPEbs/RDg==
X-Received: by 2002:a05:600c:1e26:b0:43c:fffc:7886 with SMTP id
 5b1f17b1804b1-43f1fe16701mr20175605e9.8.1744196139995; 
 Wed, 09 Apr 2025 03:55:39 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235a5e90sm12252085e9.38.2025.04.09.03.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 03:55:39 -0700 (PDT)
Message-ID: <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org>
Date: Wed, 9 Apr 2025 12:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] meson: Add wasm build in build scripts
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Cc'ing Pierrick

On 7/4/25 16:45, Kohei Tokunaga wrote:
> has_int128_type is set to false on emscripten as of now to avoid errors by
> libffi. And tests aren't integrated with Wasm execution environment as of
> now so this commit disables tests.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   configs/meson/emscripten.txt  |  6 ++++++
>   configure                     |  7 +++++++
>   meson.build                   | 14 ++++++++++----
>   meson_options.txt             |  2 +-
>   scripts/meson-buildoptions.sh |  2 +-
>   5 files changed, 25 insertions(+), 6 deletions(-)
>   create mode 100644 configs/meson/emscripten.txt
> 
> diff --git a/configs/meson/emscripten.txt b/configs/meson/emscripten.txt
> new file mode 100644
> index 0000000000..054b263814
> --- /dev/null
> +++ b/configs/meson/emscripten.txt
> @@ -0,0 +1,6 @@
> +[built-in options]
> +c_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +cpp_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +objc_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +c_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
> +cpp_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
> diff --git a/configure b/configure
> index 02f1dd2311..a1fe6e11cd 100755
> --- a/configure
> +++ b/configure
> @@ -360,6 +360,10 @@ elif check_define __NetBSD__; then
>     host_os=netbsd
>   elif check_define __APPLE__; then
>     host_os=darwin
> +elif check_define EMSCRIPTEN ; then
> +  host_os=emscripten
> +  cpu=wasm32
> +  cross_compile="yes"
>   else
>     # This is a fatal error, but don't report it yet, because we
>     # might be going to just print the --help text, or it might
> @@ -526,6 +530,9 @@ case "$cpu" in
>       linux_arch=x86
>       CPU_CFLAGS="-m64"
>       ;;
> +  wasm32)
> +    CPU_CFLAGS="-m32"
> +    ;;
>   esac
>   
>   if test -n "$host_arch" && {
> diff --git a/meson.build b/meson.build
> index 41f68d3806..bcf1e33ddf 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -50,9 +50,9 @@ genh = []
>   qapi_trace_events = []
>   
>   bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
> -supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
> +supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux', 'emscripten']
>   supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
> -  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64']
> +  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64', 'wasm32']
>   
>   cpu = host_machine.cpu_family()
>   
> @@ -353,6 +353,8 @@ foreach lang : all_languages
>         # endif
>         #endif''')
>       # ok
> +  elif compiler.get_id() == 'emscripten'
> +    # ok
>     else
>       error('You either need GCC v7.4 or Clang v10.0 (or XCode Clang v15.0) to compile QEMU')
>     endif
> @@ -514,6 +516,8 @@ ucontext_probe = '''
>   supported_backends = []
>   if host_os == 'windows'
>     supported_backends += ['windows']
> +elif host_os == 'emscripten'
> +  supported_backends += ['fiber']
>   else
>     if host_os != 'darwin' and cc.links(ucontext_probe)
>       supported_backends += ['ucontext']
> @@ -2962,7 +2966,7 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
>       return 0;
>     }''', args: qemu_isa_flags))
>   
> -has_int128_type = cc.compiles('''
> +has_int128_type = host_os != 'emscripten' and cc.compiles('''
>     __int128_t a;
>     __uint128_t b;
>     int main(void) { b = a; }''')
> @@ -4456,7 +4460,9 @@ subdir('scripts')
>   subdir('tools')
>   subdir('pc-bios')
>   subdir('docs')
> -subdir('tests')
> +if host_os != 'emscripten'
> +  subdir('tests')
> +endif
>   if gtk.found()
>     subdir('po')
>   endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 59d973bca0..6d73aafe91 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -34,7 +34,7 @@ option('fuzzing_engine', type : 'string', value : '',
>   option('trace_file', type: 'string', value: 'trace',
>          description: 'Trace file prefix for simple backend')
>   option('coroutine_backend', type: 'combo',
> -       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
> +       choices: ['ucontext', 'sigaltstack', 'windows', 'auto', 'fiber'],
>          value: 'auto', description: 'coroutine backend to use')
>   
>   # Everything else can be set via --enable/--disable-* option
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 3e8e00852b..cbba2f248c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -80,7 +80,7 @@ meson_options_help() {
>     printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
>     printf "%s\n" '                           [NORMAL]'
>     printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
> -  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
> +  printf "%s\n" '                           auto/fiber/sigaltstack/ucontext/windows)'
>     printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
>     printf "%s\n" '                           package'
>     printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'


