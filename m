Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p7sTc-0000Kx-7T
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 01:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7sTa-0000KZ-Kp; Wed, 21 Dec 2022 01:21:14 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7sTY-0007tK-Jn; Wed, 21 Dec 2022 01:21:14 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id f24so6801548vkl.9;
 Tue, 20 Dec 2022 22:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zf8f3RG78hUiHLrKJx1Yy2VsT+1N68MtJs6UOlmpwz4=;
 b=eA3n5Jc/4GZ+bbC5tkEk3MH3pxeykC3877NiknNfevAir5dnRvV8vhTwhD4x5F5F9Y
 Dr4wrKPbsTaK9xOFCvZQuUXii2eGqkcahh9qAGB2mpBYz30BJ7Z0YUX5uniGDm9vOgV+
 2GcQbLCi6XE9IcREgGCaiBjHVKTF6c41fjD+5NSgxUvWYvUIrgCLD5+GjjumBKOO8/ov
 Unz/lMDKVfWH3O09qOjF66lu0JTWb3TbXnZlz+sJRpGJmNY4HTXSep9qA9wZp1kZOYMH
 jNsLwLXKQjXEBfQAz8KucuPc41dCZTbkBcN4iQXQJ3VOknyjohbLGUixxASOjf7ETsj1
 +gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zf8f3RG78hUiHLrKJx1Yy2VsT+1N68MtJs6UOlmpwz4=;
 b=02TaPNpPFbWA2EQPAFLifkmQd960EjRcJnuv9OCcjs6WvE2vjcxHGmy0Xd4t4t2w4A
 KhkJoL27urwb7Pie6ka8fMoneNRUtCR8LftmaDB3dnXlD/8pQqx1nGnkIUISY6cpzkXw
 OrV04fJBIyPXc04Hpe+wmJAfubqcbM3b83IxGoN0We6TFfOlLEAXsRUjT2WD4gOKFPTh
 b01AexIPI41vF9Yb3pycVPVTyl/bqnUGzTpZxReKljPASNLhZPdZwdDnPMw5c7dKyo0J
 K+z//rGOdCgvUOTRbtGRzQvIRrB8ICj7/51nynq9R+uNHb/Oto5B+h/lsyNsxGvxrIsv
 Zq7g==
X-Gm-Message-State: AFqh2koLA6ksaQQqioOVaJ48VMpH+ei0N/xRVvHMp++Pe1s39+HDmect
 4RWnds/mPalHsA0/JERTljQ0iXzGeun28cnC1cA=
X-Google-Smtp-Source: AMrXdXt2dIPtx+SjWBgv567ebnbvTFDnalD/KK80r09TK/U+TGr7QsFoN+p1gs09yTiacIs+w7FVzD1S+t97qu7SK08=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr66557vke.34.1671603670433; Tue, 20 Dec
 2022 22:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20221203175744.151365-1-richard.henderson@linaro.org>
In-Reply-To: <20221203175744.151365-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Dec 2022 16:20:44 +1000
Message-ID: <CAKmqyKOY-RfSOeuuQazaZ6UvGRfOhrT7-Lk_FCDfpyybN9GZAA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set pc_succ_insn for !rvc illegal insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 06:21:15 -0000

On Sun, Dec 4, 2022 at 3:58 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Failure to set pc_succ_insn may result in a TB covering zero bytes,
> which triggers an assert within the code generator.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1224
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c          | 12 ++++--------
>  tests/tcg/Makefile.target         |  2 ++
>  tests/tcg/riscv64/Makefile.target |  5 +++++
>  tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
>  4 files changed, 43 insertions(+), 8 deletions(-)
>  create mode 100644 tests/tcg/riscv64/test-noc.S
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..1ed4bb5ec3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1064,14 +1064,10 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>
>      /* Check for compressed insn */
>      if (insn_len(opcode) == 2) {
> -        if (!has_ext(ctx, RVC)) {
> -            gen_exception_illegal(ctx);
> -        } else {
> -            ctx->opcode = opcode;
> -            ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (decode_insn16(ctx, opcode)) {
> -                return;
> -            }
> +        ctx->opcode = opcode;
> +        ctx->pc_succ_insn = ctx->base.pc_next + 2;
> +        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
> +            return;
>          }
>      } else {
>          uint32_t opcode32 = opcode;
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 75257f2b29..14bc013181 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -117,6 +117,8 @@ endif
>
>  %: %.c
>         $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +%: %.S
> +       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>  else
>  # For softmmu targets we include a different Makefile fragement as the
>  # build options for bare programs are usually pretty different. They
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
> index b5b89dfb0e..9973ba3b5f 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -4,3 +4,8 @@
>  VPATH += $(SRC_PATH)/tests/tcg/riscv64
>  TESTS += test-div
>  TESTS += noexec
> +
> +# Disable compressed instructions for test-noc
> +TESTS += test-noc
> +test-noc: LDFLAGS = -nostdlib -static
> +run-test-noc: QEMU_OPTS += -cpu rv64,c=false

This fails the `make check-tcg` for Linux user mode when testing plugins.

This diff is required to get it working. I have applied the change myself

diff --git a/tests/tcg/riscv64/Makefile.target
b/tests/tcg/riscv64/Makefile.target
index 9973ba3b5f..cc3ed65ffd 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -9,3 +9,4 @@ TESTS += noexec
TESTS += test-noc
test-noc: LDFLAGS = -nostdlib -static
run-test-noc: QEMU_OPTS += -cpu rv64,c=false
+run-plugin-test-noc-%: QEMU_OPTS += -cpu rv64,c=false

Alistair

> diff --git a/tests/tcg/riscv64/test-noc.S b/tests/tcg/riscv64/test-noc.S
> new file mode 100644
> index 0000000000..e29d60c8b3
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-noc.S
> @@ -0,0 +1,32 @@
> +#include <asm/unistd.h>
> +
> +       .text
> +       .globl _start
> +_start:
> +       .option norvc
> +       li      a0, 4           /* SIGILL */
> +       la      a1, sa
> +       li      a2, 0
> +       li      a3, 8
> +       li      a7, __NR_rt_sigaction
> +       scall
> +
> +       .option rvc
> +       li      a0, 1
> +       j       exit
> +       .option norvc
> +
> +pass:
> +       li      a0, 0
> +exit:
> +       li      a7, __NR_exit
> +       scall
> +
> +       .data
> +       /* struct kernel_sigaction sa = { .sa_handler = pass }; */
> +       .type   sa, @object
> +       .size   sa, 32
> +sa:
> +       .dword  pass
> +       .zero   24
> +
> --
> 2.34.1
>
>

