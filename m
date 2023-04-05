Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuhK-00066h-8q
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuhI-00066L-68; Wed, 05 Apr 2023 00:24:36 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuhG-0003I7-IE; Wed, 05 Apr 2023 00:24:35 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id z17so23743831vsf.4;
 Tue, 04 Apr 2023 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680668673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgNWiM3vFvQUz+L56D8jQ2XsPQa4C6DAeo1BYmgpQZo=;
 b=COSNIBCG+opRpXtq0eRL0m6fNHzuZeoqOkOvdKk6YHnPelCUq/5DHZdfrJYupWwijq
 fHjVj2dhdm84yN/WYR+5XCjbyLgZlZ1QYiwZV+efw15CnqvcunhExI0dZ+x8yXdCpfPp
 4zBIDp99wwJA21wnh/69n3m9/HhoL9x+K13WSYWa1pPDV7fjwVnVQHwoTgiEmUJDO3dv
 ao7rZ/ux0ZoYXc7juWVS3dxvkBXEHRvHHla2AFrw+mkLjfwANHdx7cnMRdav8+cxUHk4
 Pyy//+AraFifoOCSWOWOJBAEWus6FYzqBAZ0CqtXwSnp7xhxt5NLR5SwAfJBVaBgVe/k
 i/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680668673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgNWiM3vFvQUz+L56D8jQ2XsPQa4C6DAeo1BYmgpQZo=;
 b=GSooRYxt2qGdzDJDtW+ryw+s4Chi2oZFpi2Gz9M+Yb4TdmLwtaBEvhTph1E6kFi5b7
 fDEH3jrD5o3drxUiRq0zW/0FviWwVbkIluj39PzJOkwMXfoaP876cg7SWHvO9vj1q1CA
 cdHz8mEKDBa2qJvZrsrFwAxxOpQ7B7FEkIYw5KtZ24K6cTolXSVOn5JYrQwst0uvv34p
 WuiB1g3ndqoBSqrCPfdYewLq2HPVBTswgk6hJpdSxGrtv49NL9sAMIIqsBB2qp/DT/MH
 H5DgdOkzNItTwNzSaB6FWiEgV7hLVs7nKkHMN9zRVomTh0ultnsTefdOyEKhldrMpWzL
 0Dbg==
X-Gm-Message-State: AAQBX9fXdY1rSKeNwJK+0s8wT5THoekPZos0S0WDVzztGIbu56+wUT+Z
 d1DP0f83O/1u7H74bYmA35AugjSfu6ubIAku4OE=
X-Google-Smtp-Source: AKy350bcflOLUa/fy2fFGtg/nDnzd1lOCzztfVbXLDDoq8ztHK074Uywcvb5WswOtmanQNXixNTY+j79adWiKeOq2k4=
X-Received: by 2002:a67:ca90:0:b0:422:1654:7737 with SMTP id
 a16-20020a67ca90000000b0042216547737mr4021637vsl.3.1680668672856; Tue, 04 Apr
 2023 21:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230321043415.754-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230321043415.754-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:24:06 +1000
Message-ID: <CAKmqyKOK6b5Bmn=rcCTuA4NNdrkT_0nZxezPOkh1XUp7wW1mSg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix priv version dependency for vector and
 zfh
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:24:36 -0000

On Tue, Mar 21, 2023 at 2:35=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
> Vector implicitly enables zve64d, zve64f, zve32f sub extensions. As vecto=
r
> only requires PRIV_1_10_0, these sub extensions should not require priv v=
ersion
> higher than that.
>
> The same for Zfh.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..eaf75a00a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -84,7 +84,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
>      ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
> -    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
> +    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
>      ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
>      ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
>      ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
> @@ -104,9 +104,9 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
>      ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
>      ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
> -    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
> -    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
> -    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
> +    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_10_0, ext_zve32f),
> +    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_10_0, ext_zve64f),
> +    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_10_0, ext_zve64d),
>      ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
>      ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
>      ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
> --
> 2.17.1
>
>

