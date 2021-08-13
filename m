Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEPpa-0008Nq-TU
	for mharc-qemu-riscv@gnu.org; Fri, 13 Aug 2021 01:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPpZ-0008NR-LQ; Fri, 13 Aug 2021 01:34:09 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPpY-0002eM-3R; Fri, 13 Aug 2021 01:34:09 -0400
Received: by mail-io1-xd30.google.com with SMTP id y1so11674843iod.10;
 Thu, 12 Aug 2021 22:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iXR9zOGQqtbhDnjO+IHjjf9eGkOLZosT7GkeNQp2DA=;
 b=ST1oR+UyARJZVIxmCalXuxgBBBqhBJdTkuHwI6bRx+LVsbFLRgagpgGyfO42sDdIyw
 zFhuZgdfUXTMNw6zYD5xLsEW1xJqBJqxzpW0KBHc6m2C/lJTFME6/vTPdMzHMieStztJ
 MUXaY0cCeDmUBI4p+Lz0agTaWUVC/KPVXQvPX/CYPcigMXtkyzLGhSfUqW/e1ix9ypG/
 MxPkhy9M5dJIHQGANSVFgYEL9n0rSQtNzit4+oq+vw1au2Z7SX5bWsiuZyeu/Cpf/q/i
 8HSpOblTsOX7OUzVxbvotpvcgMTl4CeLUDLarB0wNgHSL1WEHf2SAeo8+CYDFFIvl2Dl
 HcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iXR9zOGQqtbhDnjO+IHjjf9eGkOLZosT7GkeNQp2DA=;
 b=MXIG1N0PGwSZ1jpMWhVL75LoVE6vbIMPCcLkcho5s9pY+6cfZIJoDvKHbzHKBEgHFK
 IYJ4kM/lvMQtxMtCHaHoOSTwOVoGxe79K370Tt2lys58Ot55MEBLC1Eg0ofShz4SpnyK
 K/yofbKyycTLRm5kM8EsigQO9wskswXRXesG1NZsd8VqxoG4T4gtCZRj/eLvSZ+mxfl1
 t82OkL67PZ6GFwnSx3s6Fx5TnwACIRPhxD++7ZuoPORsCH4TgBdYX3xzFTyeyxg9FNCK
 zAax6VN8kXTLoxX+qSNGlHkVEdXZBxVHo4ILWvp+ndJS4IK9bLFgsL0dN7Uq0vmjdiRU
 UCqQ==
X-Gm-Message-State: AOAM532s4dGCZTHunUclzF94TrhDOHS6t7CGBEL/enRmOCzuqy9Rodxo
 LHg+CJ1/y8N/t6315AseB2EhuXcFlL1fOj2uEkU=
X-Google-Smtp-Source: ABdhPJxc9uiNGmELsVNgljclmbrEv1LpIvIma+j6scDcHbRjJt5vUeiXnUKAUaAunbrTOTh6sMpZZ6Oenqo/Bk6RF0Y=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr701542iod.175.1628832846749; 
 Thu, 12 Aug 2021 22:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
In-Reply-To: <20210805175626.11573-1-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 15:33:41 +1000
Message-ID: <CAKmqyKPXe0HZ1nzy3N+Z+=97bzM=yjjOVubT-8=ZvMG4_LABdg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/4] Add basic support for custom CSR
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Aug 2021 05:34:10 -0000

On Fri, Aug 6, 2021 at 3:59 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
>
> Dear all,
>
> In this patch, the implementation of custom CSR handling logic is introduced.
>
> If --enable-riscv-custom is set during configuration, custom CSR logic will be
> turned on. During CPU model initialization, setup_custom_csr() is invoked to
> register vendor-provided custom CSR opsets into a hash table.
> When accessing a CSR, in riscv_csrrw(), is_custom_csr() will be called to check
> whether the encountering csrno is a custom CSR. If that's a custom one, a
> struct riscv_csr_operations will be returned and such CSR will be served
> accordingly.

Thanks for adding this. I don't think we need to expose it via the
config logic. A Kconfig option would be enough, it can be enabled by
default and users can choose to disable it if they really want.

>
> The performance slowdown could be easily tested with a simple program running
> on linux-user mode.
>
> /* test_csr.c */
> #include <stdio.h>
> #include <unistd.h>
> #include <sys/time.h>
>
> int main (int ac, char *av[]) {
>    struct  timeval start;
>    struct  timeval end;
>    gettimeofday(&start,NULL);
>    unsigned int loop_n = 999999 ;
>    unsigned char i;
>    unsigned char o;
>    do {
>        for(i=0; i<32; i++) {
>        #if defined(FCSR)
>        __asm__("csrw fcsr, %0;"::"r"(i));
>        __asm__("csrr %0, fcsr;":"=r"(o));
>        #elif defined(UITB)
>        __asm__("csrw 0x800, %0;"::"r"(i));
>        __asm__("csrr %0, 0x800;":"=r"(o));
>        #endif
>        }
>        --loop_n;
>    } while (loop_n > 0);
>    gettimeofday(&end,NULL);
>    unsigned long diff = 1000000 * (end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
>    printf("%f\n", (double)(diff)/1000000);
>    return 0;
> }
>
> $ riscv64-linux-gnu-gcc -static -DUITB ./test_csr.c -o ./u
> $ riscv64-linux-gnu-gcc -static -DFCSR ./test_csr.c -o ./f
>
> For a custom CSR, uitb, being accessed on andes-ax25 :
> $ ./build/qemu-riscv64 -cpu andes-ax25 ./u
> 4.283091
>
> For a stock CSR, fcsr, being accessed on andes-ax25:
> $ ./build/qemu-riscv64 ./f
> 3.875519
>
> For a custom CSR being accessed on stock rv64:
> $ ./build/qemu-riscv64 -cpu rv64 ./u
> Illegal instruction (core dumped)
> # This is expected to fail.
>
> Currently, the statics on my hands shows that :
> When the custom CSR handling mechanism is activated, we will suffer a 17% slow-
> down on stock CSRs and the penalty of accessing to a custom CSR will be another
> 7% more.

Thanks for testing this.

The critical number here is what is the impact for a CPU that doesn't
have the custom CSRs. So for example what impact does this have on the
rv64 accessing a standard CSR? We don't want to affect performance of
other CPUs. CPUs with custom CSRs can take the performance hit as it
adds a useful feature for them.

Alistair

>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> Changes from v3 :
> * Adding options in configure and meson files to turn on/off custom CSR logic.
> * Adding unlikely() to check if custom_csr_map is set.
> * Moving any32 and any out of !(CONFIG_USER_ONLY) for enabling linux-user mode.
> * Fix comment style, add missing license boilerplate.
>
>
> Ruinalnd ChuanTzu Tsai (4):
>   Adding basic custom/vendor CSR handling mechanism
>   Adding Andes AX25 and A25 CPU model
>   Enable custom CSR logic for Andes AX25 and A25
>   Add options to config/meson files for custom CSR
>
>  configure                      |   6 ++
>  meson.build                    |   2 +
>  meson_options.txt              |   2 +
>  target/riscv/andes_cpu_bits.h  | 124 +++++++++++++++++++++++++
>  target/riscv/cpu.c             |  51 +++++++++++
>  target/riscv/cpu.h             |  33 ++++++-
>  target/riscv/cpu_bits.h        |   4 +
>  target/riscv/csr.c             |  83 ++++++++++++++---
>  target/riscv/csr_andes.inc.c   | 160 +++++++++++++++++++++++++++++++++
>  target/riscv/custom_cpu_bits.h |  12 +++
>  10 files changed, 462 insertions(+), 15 deletions(-)
>  create mode 100644 target/riscv/andes_cpu_bits.h
>  create mode 100644 target/riscv/csr_andes.inc.c
>  create mode 100644 target/riscv/custom_cpu_bits.h
>
> --
> 2.32.0
>
>

