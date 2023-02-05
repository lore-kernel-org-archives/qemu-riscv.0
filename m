Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOoF1-0000d3-Ez
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 18:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoEz-0000cq-8G; Sun, 05 Feb 2023 18:16:10 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoEx-0005eV-EA; Sun, 05 Feb 2023 18:16:08 -0500
Received: by mail-vk1-xa30.google.com with SMTP id l20so5284363vkm.11;
 Sun, 05 Feb 2023 15:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XuSsdUdF5IXtrgXVRq1Ni2HKIfS1ILZlZnKVY2ApFYE=;
 b=axKbBiM8pYWcT2pisn22WM0awtVNs5NF4CqVCLL19qCatmD/GsNwONmw0s8dQC44nw
 T+75QsRqnCEMoCR0EClMYjfoQvmWz7p5T3gKN4cmNWm4nbgGL5ShlBn8axdqJS9aCj96
 Tc80wWkgG9ddXQr1CBNpo7Ek5Ylz9Ay2dGxrAnkerIVLArhv1UD768D2pCG9Qzwwab7c
 MclI2CxvojfWL9L8dXcJuzzFhBLKHkE6xSEX0IPrW+ApYatN6HSIrhC8++84puNh0uGm
 BxIrpQmJWgWNjFNMxRQp2K0/uDocGib925hgp8nSf0AEUA9jioxfUhsBZ5+gkJd6oDAu
 xU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XuSsdUdF5IXtrgXVRq1Ni2HKIfS1ILZlZnKVY2ApFYE=;
 b=SchxnRJawxYsi3/bCPYbxqXwkZBwEYRa4qVwsW7gysS00gWHRvfnG7EdpguTJbCp/K
 J2nE/0PVkTyjWPEBM2iVfC/N/9+ENRCA5SJuo+IqtrNN1GDJWqwnJWQFAsgBqX2iI8iz
 zWWR41i0jY7oN1kh1rEjcxRtSokJBzbLLp8y9AMekWOtIEyUwSYV3GAQ5DV2kfXEaFB7
 MrAc9xt229o+zseGHwMWB0PTvM7o0K55+eaJ6SndyHJDA+ums2nq2EVbaB+9Yl5JdDOQ
 1jKbC0pLYjKes5In9HBBjdvP7fN9c1Z6sJqSd2B97UwCwQ+PzBlg+BDrMv28+04593VS
 4YQA==
X-Gm-Message-State: AO0yUKVYhMAvZb/Dz4JITWKMbttRix4Em7S6xHAldDifnG7PiFeSSoaI
 y4LxMhYTgJX14uT+VKmOEE+Xt/yHKQzK+gLsjxfo4CWk1MY=
X-Google-Smtp-Source: AK7set+0vBGLkv3w8Y3474mDl7drG5wbepvFHR6rePTLnBJRm5L1n1tFmB7Z8Ijm1ZzBFzmpx3LRfj5sChKyoPXFXw4=
X-Received: by 2002:a05:6122:7c9:b0:3ea:3dee:4545 with SMTP id
 l9-20020a05612207c900b003ea3dee4545mr2503408vkr.26.1675638965801; Sun, 05 Feb
 2023 15:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 09:15:39 +1000
Message-ID: <CAKmqyKOE2NfT34_OCpafs4v8XQHdf2heWKbenC-qfNj=7U3xFA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix ctzw behavior
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
X-List-Received-Date: Sun, 05 Feb 2023 23:16:10 -0000

On Sat, Feb 4, 2023 at 6:25 PM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> According to spec, ctzw should work with 32-bit register, not 64.
>
> For example, previous implementation returns 33 for (1<<33) input
> when the new one returns 32.
>
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2:
>    - Use simpler solution suggested by Richard Henderson
> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index e2b8329f1e5b..990bc94b9840 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -401,6 +401,7 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_ZBB(ctx);
> +    ctx->ol = MXL_RV32;
>      return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
>  }
>
> --
> 2.39.1
>
>

