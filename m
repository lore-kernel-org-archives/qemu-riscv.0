Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4bj1-0001j9-6K
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 00:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4biz-0001io-4D; Mon, 12 Dec 2022 00:51:37 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4bix-0002dN-Jm; Mon, 12 Dec 2022 00:51:36 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id f189so10168141vsc.11;
 Sun, 11 Dec 2022 21:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Osso2b2TfEy2f5x4OgXGKV+mddybpWrH7h6pW8lFWg=;
 b=X9whobog7ftXykOEk0+1cSZNQfHq0tDh7syTn73zkcQqyGGtDNMkveSeMmpqAEN1nl
 KPJsZskQX/y6xL0E6waJTTSrYbcTU5Wf2Tcv0jkUZZqBdq8y1/ogifCVa373FHugAurU
 pW7dfuyXo+Q1or0vp5j0VKHwuAnBeOJacxcUOP2oo04Ga4hXY2S6Xhtc9eb2wZdSABHD
 Ib9pnhJvdGBNOtVPkoMkkAdtV8oNTOWnTMY2JpWxPDLTWVlHVfebw0VAcBTspV8CyONx
 kpw1CezwpqUE9xGdnYRbbu0U3qFQfPUoVbZnduu0fAiW7KUT1yTVFMyF+O5TgSHOBBb4
 LV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Osso2b2TfEy2f5x4OgXGKV+mddybpWrH7h6pW8lFWg=;
 b=HMzzhuKPpPXuPgOYNJm1MGsEpxNw5Y6UAAh9wm5Yy0PTS9O6TXx9ZdEdkWH9QXzirV
 /Sr0ZTyXotRU08rCPs6V0zv3RHLxADvVOkhcc4vtHgI3uJNZdi+qMfxsX/Agu1tQFl8B
 ALMyCBuw8nAf1053W931MMKT6O8o1CSzG/gnzct/pNyHCmT23vPVfRIdT120x+ff5ogQ
 DtH9eBq0ofbraUtsc1RYkOKjkRBf36UpZLqDAghRld0bq+FDNDUVhdn8OY6g6jhp7HS9
 b1IqfZsu840ATUdo38TOOKuSaVXLfxnEQ/G2xZ23pa+vPjIokqcpqCXL3/BgCbr52nbq
 Rfng==
X-Gm-Message-State: ANoB5pkgx6bTZpEdQpWMgLz8aGveu6DqP6zio9JbYY1hqCVu/HWcQtSP
 bb9CBuO+fHseZt5RzBGEgyz1KF+dyq8u+4q5sDQ=
X-Google-Smtp-Source: AA0mqf4rmlRS8caEjUgV+Z7gD1eA0uoyZtt7YhVwf48VPzOJAXgVrVgQ+U4Dje9d3FUQMNel+MIA07sW/q6jCGwVlMs=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr18357470vsa.54.1670824294181; Sun, 11
 Dec 2022 21:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20221208151159.1155471-1-christoph.muellner@vrull.eu>
In-Reply-To: <20221208151159.1155471-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 15:51:08 +1000
Message-ID: <CAKmqyKOS9KbCgFszMdb=JVw5BTDdJ5RtUNxnViEUGZO5ivSGgQ@mail.gmail.com>
Subject: Re: [RFC PATCH] RISC-V: Save mmu_idx using FIELD_DP32 not OR
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 05:51:37 -0000

On Fri, Dec 9, 2022 at 1:12 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Setting flags using OR might work, but is not optimal
> for a couple of reasons:
> * No way grep for stores to the field MEM_IDX.
> * The return value of cpu_mmu_index() is not masked
>   (not a real problem as long as cpu_mmu_index() returns only valid value=
s).
> * If the offset of MEM_IDX would get moved to non-0, then this code
>   would not work anymore.
>
> Let's use the FIELD_DP32() macro instead of the OR, which is already
> used for most other flags.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..d68b6b351d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -80,7 +80,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
>      flags |=3D TB_FLAGS_MSTATUS_FS;
>      flags |=3D TB_FLAGS_MSTATUS_VS;
>  #else
> -    flags |=3D cpu_mmu_index(env, 0);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, MEM_IDX, cpu_mmu_index(env, 0)=
);
> +
>      if (riscv_cpu_fp_enabled(env)) {
>          flags |=3D env->mstatus & MSTATUS_FS;
>      }
> --
> 2.38.1
>
>

