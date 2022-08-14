Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNLvt-00018d-DR
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 18:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLvr-00017f-7v; Sun, 14 Aug 2022 18:18:07 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLvp-0000MB-Qa; Sun, 14 Aug 2022 18:18:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id r69so5192825pgr.2;
 Sun, 14 Aug 2022 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oDK//oKeGGAa4dISJl3jxebXhxktXlGKNbhgeWT6O8E=;
 b=alErDjNRAeM7/0pohtkoGwBl6ndP67TSpdbdSWK4smywz2fl/OgXmA/pDGVXUr0ta+
 4P8s/6/4apZSfZ6FPw8xvl1Omn8DuRAdAuUF4H5NNDTEbBV5i4lP5fAoa728shYEZSrN
 VPYugKawLAf98QA5Ig+FCwhP0sny8+FtZ8t9Ia7VPVNvfrJaJxUPYkv9RR5HeevfAcwS
 VorxFEQ9KTigDJytEBygR8OFBrjASe2ZLKLUvYErFtT/foRNhqDySJdCKzWJnzwMoCLL
 N/+B+UjDDV/WC5NT1+VuZq00/ngFAVqeuvuUw3/f9s0WSyUv0qCpiCE1Y7FYQG+b4n/g
 L1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oDK//oKeGGAa4dISJl3jxebXhxktXlGKNbhgeWT6O8E=;
 b=7Wcp3ji3ohiHzRnEOKOdHFoz49rRZ/ysmOB5Uj6WUDMfSNwqLQRw/iTJWAygClS89F
 bNLsac+LL0XMZu47HX/1UyeUNQsqcMhIirhN3bNuiPZTbCqENc0faq/2+jXtUeKj9M+9
 NaeKADku2QcDbPhEhmBm2bJ4f6GPzmDIEE5U7qQrQSIMuBIhuGzKkz8KsZBf6zWK5dNS
 gCOiisLtWApzuMBfQP/BQPk5yKyNHXry0eFldmyJpx3f03d9pBQDHjXw/SC53m3zEJcM
 x07UkRJEsWi4EvB8DAPHh94FtNzTgMZxCqQ9E364VIW5W5mYw8JTh6YzVhNJKc2KcBV0
 XnbA==
X-Gm-Message-State: ACgBeo0REsni7LuWh647HjFjQOjUIapDpsh7jLSFLIkSXXOR/EpubzBF
 TVVbde7p2aHLl9RlbT17gqQPPC+Td7B5PCLKwoU=
X-Google-Smtp-Source: AA6agR5qq8bOnIZHkTJMPk+XG7XNTpsKi0AawfIaSeeZZ72vNJBt2YEvELi3WYngW/sv4W6d0pSOxXw5QCBrkoRQg/c=
X-Received: by 2002:a63:5f49:0:b0:41d:85a1:c4da with SMTP id
 t70-20020a635f49000000b0041d85a1c4damr11283104pgb.366.1660515483908; Sun, 14
 Aug 2022 15:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <20220802233307.2106839-7-atishp@rivosinc.com>
In-Reply-To: <20220802233307.2106839-7-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 08:17:37 +1000
Message-ID: <CAKmqyKOz80wpv1uPaccYiGLGkXes78+h8ooSXuqzAnDNZtmp2w@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] target/riscv: Remove additional priv version
 check for mcountinhibit
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 14 Aug 2022 22:18:07 -0000

On Wed, Aug 3, 2022 at 9:34 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> With .min_priv_version, additiona priv version check is uncessary
> for mcountinhibit read/write functions.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8753280e95b2..67367e678f38 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1489,10 +1489,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
>  static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
>                                           target_ulong *val)
>  {
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>      *val = env->mcountinhibit;
>      return RISCV_EXCP_NONE;
>  }
> @@ -1503,10 +1499,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
>      int cidx;
>      PMUCTRState *counter;
>
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>      env->mcountinhibit = val;
>
>      /* Check if any other counter is also monitoring cycles/instructions */
> --
> 2.25.1
>
>

