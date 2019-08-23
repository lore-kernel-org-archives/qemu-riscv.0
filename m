Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1Bjo-0005RE-Qx
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 11:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Bjm-0005OS-0q
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 11:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Bjk-0002UN-Ry
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 11:44:25 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Bjk-0002Se-K0
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 11:44:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id k18so9180163otr.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2019 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/d8B342O1qFhviNMOHfA1h6dqxCEf60Anv3ylTyp98=;
 b=I4bOPx0+lvKGZ/P4U99rmEkeinS2mn4vfoeMnhXr3IqTh2dTtSrk0ozWuKlRofSSf/
 oMH6+ct8YeRGlmHE7Jh5nbGaCXNiSgd5sx8jFhW/fgkigiDDZh7ZBCek2P3KZqjhLlHw
 kVo9OmhY/UCCz++SDKkdfGttRMjrciVPgy4Nh4uZ0Zjjr9cCOBOlLBNhgR2dhyWug7EE
 vXo9uQcR03e79V5UEeAiWnr2shcx9D5puYWYuka0l8a86CM1fTt7QBgwhhiKjTrlgZc3
 umMvb/PJ6RUYd9m2oeVCjc+20Pib7lQfOum3BXFV1NhDyfaEQsIqttXrpp7Rlv0zOa5M
 CoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/d8B342O1qFhviNMOHfA1h6dqxCEf60Anv3ylTyp98=;
 b=inWZ/EknFjePVf5rTKSOuyLDGLdTqbLWtOG9Sr2GbBpmA9xXZLnUNHSlajTUS7y48p
 VQOe00z/Fr8YzhYRsqXLbQr4QK3DTj+2Hyes5vM70PZc22E3gaZrJYwNe/e40gs3F35T
 P5ky2RihYoyFzBFVF7b6xUDPuofhORow92XxNhs7t4FBg63jX2iR4Ttkna6AaZz+keiq
 hWP9cOSmBfp/niS43c3Rz/CRKAjnCet4n9E4CaFCK7wBQwrKCj1wJxyWBaSSGGj45++d
 KFu+tQqJNGsq8vmh7eiaNN9PfiGWTEIJIvijrZSM2LgayBE2LAyRwIJ1C2jGZOwOc6Ai
 8fxQ==
X-Gm-Message-State: APjAAAU1LhueJc+LOaiAlJcMWQgfU/0OFSfANsEKW47Kn3oKZQm3XMop
 7+KMaoo+XVCuPB+jD6VRlD8OC2fczpHe9UAoq71Vpw==
X-Google-Smtp-Source: APXvYqzoLNLMQMp3Q7Bp87+bVUn9p6bkHCmr/TGg4yvqUTS0GDOfjBQDApyOvMCww52Atknsq5xObv3hx2Hv44miPes=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1853667otf.97.1566575063551; 
 Fri, 23 Aug 2019 08:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566573576.git.alistair.francis@wdc.com>
 <066a2c520c38b0c175c052d6a3385d5661764833.1566573576.git.alistair.francis@wdc.com>
In-Reply-To: <066a2c520c38b0c175c052d6a3385d5661764833.1566573576.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 16:44:12 +0100
Message-ID: <CAFEAcA8G8ufziwwLLWo6BQZtAHWjzt_3XMMveuMMxknKSgChNA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 7/7] target/riscv: Use
 TB_FLAGS_MSTATUS_FS for floating point
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
X-List-Received-Date: Fri, 23 Aug 2019 15:44:27 -0000

On Fri, 23 Aug 2019 at 16:37, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> Use the TB_FLAGS_MSTATUS_FS macro when enabling floating point in the tb
> flags.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index eb7b5b0af3..0347be453b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -301,7 +301,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>  #else
>      *flags = cpu_mmu_index(env, 0);
>      if (riscv_cpu_fp_enabled(env)) {
> -        *flags |= env->mstatus & MSTATUS_FS;
> +        *flags |= TB_FLAGS_MSTATUS_FS;
>      }
>  #endif

The old code was setting the bit in flags only if
it was also set in env->mstatus; the new code sets
the bit unconditionally -- deliberate change ?

thanks
-- PMM

