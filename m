Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi916-00053C-3E
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi90x-00051F-67; Wed, 03 Nov 2021 01:40:48 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi90v-0007hd-ML; Wed, 03 Nov 2021 01:40:46 -0400
Received: by mail-io1-xd29.google.com with SMTP id h81so1441575iof.6;
 Tue, 02 Nov 2021 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pxxUI3pXcd9Sr5V7kGDLOFss6pVvlDWHX345L2qCTLs=;
 b=mgiitGhbWUQziXiTTzv7ouELb2TShEJTYn72YUfGlJdGlPWQokH8uB9mc76tYMfU4G
 aeQSpTUKntJu31cEtd5FqmItTMg2iXghHi4+ljDscvXOxwh2BltUAkI9XgUgjul1iOsk
 3Cf38obAQdVJNv9Ki35auOBeZhW/d/j1P7QjbX3E8M5vTAgT7S0Wl8uY3fBuCuBAr12M
 Rg77IWTmGObFUjTXBE0VsGJmR1xRjn8/qcVAezhBI7qEml+Kf1DBN1leDrdt5DV2iMd9
 joS2v3KE/eIsJI8m4yB4hqtL6FYi1TBPWXoOD6qm0/KyF0lY4jEmNY8VOuhbLQ3y2dg6
 cFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxxUI3pXcd9Sr5V7kGDLOFss6pVvlDWHX345L2qCTLs=;
 b=ihlYAXni1fkZiYSoyXaRyCQplK/SVYcGOogvrRPlEtshQLHB55549DUiUHgoo/FDs6
 L7yswuNe4znTg5qfOx+yGSS+uf05SS1jLOn0LiUo2pJaiOLayVctph7qIfe81C87XC3D
 mHVwmbqfvzo2vA6qLvwXF8R6gKjPxsaF80WUq67lfv6M6gIw5V35FjYZ4xKozuO1fc5/
 x0f1/o4rmY/0yjx8ltu4GILluhSF4pIpjQ5zD/i0f0n95QeY1O8+8VZyESZH+0NHDU9z
 8h5cRDjDgNRgrEAN8DuTMw7P6tPqXzhwO9IJDgmnJqG8mgikBW6RAxouUThhRjexRf6S
 w7LA==
X-Gm-Message-State: AOAM530axD6KhD1tjD+hBsqDjwoUOGXRPpv/f2gANPm5sJxxUPhQnpYT
 9D3i73tR5xtTdfl72pzmISSOSoiMcgDmWKZ04oA=
X-Google-Smtp-Source: ABdhPJzQ8olfXIF1RUNX2Qy7IX9cBFIcR+d0vJsQePfAD97ryigL9nzgqH3+cLgP5N5YEAvMfdpcVGXLDr5nDO2ERwk=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr29304597iow.91.1635918042606; 
 Tue, 02 Nov 2021 22:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-2-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-2-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:40:16 +1000
Message-ID: <CAKmqyKPOu2nDE8DEMSV55mp7UCYcsS45Y9dDCbeKXvEh6HxDbw@mail.gmail.com>
Subject: Re: [ PATCH v3 01/10] target/riscv: Fix PMU CSR predicate function
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:40:49 -0000

On Tue, Oct 26, 2021 at 6:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The predicate function calculates the counter index incorrectly for
> hpmcounterx. Fix the counter index to reflect correct CSR number.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 23fbbd32162a..1ec776013435 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -89,8 +89,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
> -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
> +            ctr_index = csrno - CSR_CYCLE;
> +            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                 get_field(env->mcounteren, 1 << ctr_index)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
> @@ -116,8 +117,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> +                ctr_index = csrno - CSR_CYCLEH;
> +                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                     get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
> --
> 2.31.1
>
>

