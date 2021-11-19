Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3UP-0006co-20
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3UN-0006a6-BQ; Fri, 19 Nov 2021 07:59:35 -0500
Received: from [2607:f8b0:4864:20::d34] (port=35381
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3UL-0000qA-EF; Fri, 19 Nov 2021 07:59:34 -0500
Received: by mail-io1-xd34.google.com with SMTP id 14so12579999ioe.2;
 Fri, 19 Nov 2021 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e1Lyfnr/HkRE+UMDdKj4f1fcRsdmxaPaKtk9idzpi2s=;
 b=BM9qV7JSgOr/yWitvBj+4vfhxZYPZPSK+40LAz9WXqRPzneDCcyeg7hkN4TF+xHkgF
 9R9sufEdPL5Sf5sEuSQb6PRWIdxlT8z/e5m+APfpYQvmDri00GRzCV8qZDrwlEtQRXxl
 Sq+jT10lb9qt07eOZkcB+Ny2DU5gnRgltpbKUC7cnM0mkHpc/JbpnVavzPq3GjVzrPR7
 Uk/QiPkt8taL0fsjn/qbdXsnZQ7zKgB1KY/XCJ0AH4wfRzvP7HOaLt1VNQO9oxJQ4VzI
 bzV7gDuY69yTx6P+SBaP96BiB76ca3ZGjQI/Qs0XTpxzjqaXq/YiHZs6gfQXgjpBJaPI
 kS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e1Lyfnr/HkRE+UMDdKj4f1fcRsdmxaPaKtk9idzpi2s=;
 b=Ec+HuCKqspSbaGDbcNdz+wWoa3GPKY7zK8SPwadS+ruhSfaR67kdZf+snEENvNbeLy
 2rqQCdDaaCxv/+4Ly5ejMxIUnLOTauAVx5ZPV7vhySykurPtS5DpcFQWPB3i3xkpaDF8
 6UfWZOn02u4QYB3mNmn7hMKoVskmTmxY6WjevqnUvDe7SkTAXIECrD7Oedu16D60G5sD
 S/4MagDJgHLSYJiA7+Y7j2odNDgWyUToJv2oLPmfslTCKZATcOrUBC7w8czr5WBctsA0
 BXV4cvtEBLtU5S45ItGFExJMpDWIDCS+ijiKiukJAuzdeZvACxMY0QXI7b96NM0Up5x0
 zGZQ==
X-Gm-Message-State: AOAM531plclu+QlfpAu90BiBwr/6gSZ6EZ86LoeDG1aauns8P/uXjlHG
 Pcz2UyCsk8fgWNXnbw06o5Y7L1JhW1OzuPD+LUg3dQOgFInn2ovTvBY=
X-Google-Smtp-Source: ABdhPJzqo2F9Esm9ZyLmXNGOiqwnry3oqsL7ksABVQUm9/uv2M9foNREHOPe+R/gN/quF6HHs0R+ombF2cp5Pp3reUA=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr5070194ioc.187.1637326771973; 
 Fri, 19 Nov 2021 04:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20211116151138.81209-1-zhiwei_liu@c-sky.com>
 <CAKmqyKMAzzV=6pWY2V9r1UmCFGG__JBuFGhTQ19Uo=VwiD2eww@mail.gmail.com>
 <79ba686c-1a8d-18ad-814c-7e5733f84868@c-sky.com>
In-Reply-To: <79ba686c-1a8d-18ad-814c-7e5733f84868@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:59:04 +1000
Message-ID: <CAKmqyKO3p2amQnpXmwHku12jr-20mNSOYu4t9c=d-YknO=XLKg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check PMP rules num before propagation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 12:59:35 -0000

On Wed, Nov 17, 2021 at 10:42 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> 0
>
> On 2021/11/17 =E4=B8=8A=E5=8D=888:03, Alistair Francis wrote:
> > On Wed, Nov 17, 2021 at 1:12 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >> If PMP rules number is zero, it should not influence the TLB entry for
> >> M-mode program.
> > This doesn't sound right. From what I can tell if we have no rules
> > pmp_is_range_in_tlb() shouldn't have an effect on the tlb_size. What
> > error are you seeing?
>
> When address is in [0-4K] and no pmp rule configured,  the tlb_size will
> be set to 1.
>
> This  is caused by pmp_get_tlb_size return a value 1.
>
> if (pmp_sa >=3D tlb_sa && pmp_ea <=3D tlb_ea) {
>           return pmp_ea - pmp_sa + 1;
>
> }
>
> Here pmp_sa =3D=3D 0 and pmp_ea =3D=3D 0.

Ah ok. Do you mind adding that to the commit message.

Also, do you think it would be better to add the check to
pmp_is_range_in_tlb() instead?

Alistair

>
> Thanks,
> Zhiwei
>
> > Alistair
> >
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >> ---
> >>   target/riscv/cpu_helper.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index 9eeed38c7e..48da872d39 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -376,7 +376,7 @@ static int get_physical_address_pmp(CPURISCVState =
*env, int *prot,
> >>       }
> >>
> >>       *prot =3D pmp_priv_to_page_prot(pmp_priv);
> >> -    if (tlb_size !=3D NULL) {
> >> +    if ((tlb_size !=3D NULL) && pmp_get_num_rules(env)) {
> >>           if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_s=
ize_pmp)) {
> >>               *tlb_size =3D tlb_size_pmp;
> >>           }
> >> --
> >> 2.25.1
> >>
> >>

