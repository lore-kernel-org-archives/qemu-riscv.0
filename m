Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytuE-0005bi-1W
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jytuC-0005b5-2R; Fri, 24 Jul 2020 05:22:16 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jytuA-0005l1-D6; Fri, 24 Jul 2020 05:22:15 -0400
Received: by mail-yb1-xb42.google.com with SMTP id d133so2411632ybh.5;
 Fri, 24 Jul 2020 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNM8E9/+q8IKpeRrn7ZU7uK706DUw8E2QRawmufOm1g=;
 b=Y/FLH/6uoI9xr/ZmYVoS1uEG7N/JHfxupqqrJGiIv/AzT8zBW4KEUdPdOQHp3AXaDF
 +xEUciG+PZw+RLOOe0sQcOZX99Pf5xhMxH36lRQBnOmIShmV9Tw/Tv5O/yRLLIIJB6n7
 9Hoj39vhvQS91Y5R1KliZo+YVettEQ+DyBTIwF6WjIXlDgqffLTZq2HNNMj+gMffkbLk
 kExAWXAazskksHRbUpe+HnXg+r8wEUy4Rfg4qS+cvf4EliOsWIvR8psAbC2trJB0o+gX
 BPLLjsgSOWmSV5wCOPR1pZom/ERNI0rgGwZSuQv/SgNcyoERSRGtEQ4l9MJvXF5glvc9
 l0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNM8E9/+q8IKpeRrn7ZU7uK706DUw8E2QRawmufOm1g=;
 b=Oai+Pldizz0MMeXYVuIrhHzVC8YE/ctymABNWJiDdGyYbt8inAgj5EtbEZj8BHl0IF
 MZGJnKizIxmJwt5FvQ8NDHsUPbqtKoU8q+UI8k0Q8StJVUxInwOqSDejUxEGbx8O5QlB
 jEVpsUIoBaCE1PzDe8XVlFk02BEtAGYQkjB/Xa1SABBudnCvzsmlQHAtcBaeYtrNcI4+
 QQrC3DuNkEiZ4n/jBGGt3Okdo+2x4pC/wfhXsdrHBzlx/xADEgQfpe0jzvRPzVTDhdSe
 lb2B4YqTuaO/YbtQBkOLQXn1Ihp/nvD3DADzq0CoY+GbYvKq28kSNcu7Q+cBOcqPc4M5
 /6ow==
X-Gm-Message-State: AOAM532f1myH99AnYdEO/Gz5Tz8QDmW5WCC8YDPYAJ/ISVCgg46pS5bj
 eL9oRJZYgkJqRhzGlm38E65qZPYfGkCd3rGyuMA=
X-Google-Smtp-Source: ABdhPJx4cVEzPOe5QoZ3tlBgTKHTb2NRrrHNKpoZoHCYemtY/FoiHfwr48SsPkZ90TMmYMUWmraGahiNTMj/B4HpxNE=
X-Received: by 2002:a25:d953:: with SMTP id q80mr2013136ybg.387.1595582532596; 
 Fri, 24 Jul 2020 02:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595581140.git.zong.li@sifive.com>
 <56c2770fc75e1e0c833248ea5d9faa038b69e328.1595581140.git.zong.li@sifive.com>
In-Reply-To: <56c2770fc75e1e0c833248ea5d9faa038b69e328.1595581140.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 24 Jul 2020 17:22:00 +0800
Message-ID: <CAEUhbmX-va3wLY_aU7QYXE0ke0sn-4mfenz5Mszy+2k9NMib9A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv/pmp.c: Fix the index offset on RV64
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 24 Jul 2020 09:22:16 -0000

Hi Zong,

On Fri, Jul 24, 2020 at 5:08 PM Zong Li <zong.li@sifive.com> wrote:
>
> On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> implementation, the second parameter of pmp_write_cfg is
> "reg_index * sizeof(target_ulong)", and we get the the result
> which is started from 16 if reg_index is 2, but we expect that
> it should be started from 8. Separate the implementation for
> RV32 and RV64 respectively.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/pmp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2a2b9f5363..e0161d6aab 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -310,6 +310,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>      int i;
>      uint8_t cfg_val;
>
> +#if defined(TARGET_RISCV64)
> +    reg_index >>= 1;
> +#endif
> +
>      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
>      if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> @@ -335,6 +339,10 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>      target_ulong cfg_val = 0;
>      target_ulong val = 0;
>
> +#if defined(TARGET_RISCV64)
> +    reg_index >>= 1;
> +#endif
> +
>      for (i = 0; i < sizeof(target_ulong); i++) {
>          val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
>          cfg_val |= (val << (i * 8));
> --

It seems you missed to address my review comments in v3? reg_index
should be shifted after we call the trace function.

Regards,
Bin

