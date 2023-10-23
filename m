Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B1FC0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:47:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qukxj-0008Ah-Ms; Sun, 22 Oct 2023 22:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukxg-000898-Ui; Sun, 22 Oct 2023 22:46:36 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukxf-00066l-5V; Sun, 22 Oct 2023 22:46:36 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-45845db2d63so853067137.3; 
 Sun, 22 Oct 2023 19:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698029193; x=1698633993; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/T7rQsHEmRGdc/hr5W1fSztr3FKoZqgF+ayPHaxqVE=;
 b=WfFmZvK8oEtdaWFczkifLYydDuZ+3SC2yJn/LKU2Vr+QKVUaAJyYoAcZYVl9Q0KrQ0
 DXggYQS7ABiU5rT8zH5W9JsQH+XZCU00VSS4szw6xsSZBq5ffIpDOIEa+PbAQAfcFoXg
 KWf2udLd/It+6vRwLSHC+OGbGP7dC+b5btmuswQwMgVu0jCLGd72LMl5H2S3SF0POtW4
 qYJ5OX6eAstJod50uMxoOLMRSsDSga5iubuiZAMxTEMabMheJU2tC/Oz0R0rjk6tTnjS
 VxbUmnT1GF9YF4a+iO2gbiZRMTnZiq4fPtzM+lQklq/U6TekdIgma0U9uMLvVHgLDaLT
 4xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698029193; x=1698633993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/T7rQsHEmRGdc/hr5W1fSztr3FKoZqgF+ayPHaxqVE=;
 b=t02KvDr86ZqfJhaFzjv8MPa/J+NcwvRY6x9xifv+0eF5v4rpT0H0/ZgzqvRTID3eL+
 5dEZO+wun6Al8C5QVH3cSYgXvy7lx0Dw54WkZfvF0Q1R3CLzVa6mtGJPwlwej2DgpbVR
 /KJ0V8Mt3P2rNUUno2riw1W3bBZt8rr3LJgdyojHwcLkA1fmNukYWCJzd/4j9I531DRH
 VDGV/3wtwHqQRAt2j2ytCmhJyD38EO5xHiYyhXvc02QHutfhnQt7wrxoV3LPzwinT3E8
 InIagk9kK5nq7znd8UfQQ6eH6abGZQU/GwaP7LZH1h11LtsZ/XVO6IBDWSqSdxt6kMPK
 Ih4w==
X-Gm-Message-State: AOJu0YwGKRCpKGJIuX7SiOmsc+hdKvl04epLXsPzK9CVCGibKh19zPqY
 aB2dAzb4JzbLPOqRLnPlf/YpJhG2w7w+fCmiaIY=
X-Google-Smtp-Source: AGHT+IFA5P6pRMrmWA/6PBUBNBDJ4z77RXZ3LJh2oaDNC7Aq5rbYbpYaDsmnGvdefrHUASIO6ufnzndaPcIGXQ+aRD0=
X-Received: by 2002:a67:ab09:0:b0:458:1c00:c32f with SMTP id
 u9-20020a67ab09000000b004581c00c32fmr6544291vse.34.1698029193520; Sun, 22 Oct
 2023 19:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231019065705.1431868-1-mchitale@ventanamicro.com>
In-Reply-To: <20231019065705.1431868-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:46:06 +1000
Message-ID: <CAKmqyKOPmmNXkx5fsVJZxV+ZrLgCQk6EBBfhavry=zh4gPdcVA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: pmp: Ignore writes when RW=01
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 19, 2023 at 4:57=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> As per the Priv spec: "The R, W, and X fields form a collective WARL
> field for which the combinations with R=3D0 and W=3D1 are reserved."
> However currently such writes are not ignored as ought to be. The
> combinations with RW=3D01 are allowed only when the Smepmp extension
> is enabled and mseccfg.MML is set.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in v3:
> =3D=3D=3D=3D
> - Rebase on latest riscv-to-apply.next
> - Add reviewed-by
>
> Changes in v2:
> =3D=3D=3D=3D
> - Default RW to 00 in case of an illegal value
>
>  target/riscv/pmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 4dfaa28fce2..162e88a90a6 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -123,6 +123,11 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>          if (locked) {
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lock=
ed\n");
>          } else if (env->pmp_state.pmp[pmp_index].cfg_reg !=3D val) {
> +            /* If !mseccfg.MML then ignore writes with encoding RW=3D01 =
*/
> +            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> +                !MSECCFG_MML_ISSET(env)) {
> +                val &=3D ~(PMP_WRITE | PMP_READ);
> +            }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule_addr(env, pmp_index);
>              return true;
> --
> 2.34.1
>
>

