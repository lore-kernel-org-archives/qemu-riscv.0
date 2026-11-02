Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA8F606A327
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ka70Jh4l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WqryTYcN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNnWn-0005D5-Ls; Mon, 02 Nov 2026 03:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnWA-0004tX-Sk
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:35:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnW7-0005HM-KJ
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:35:50 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A25WERw3924963
 for <qemu-riscv@nongnu.org>; Mon, 2 Nov 2026 08:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vQS0kP+1PxbcOYsLyS4eyBRzu/ad9CZ8F9mubaaroUM=; b=ka70Jh4l7v5GIMm2
 0ZK860FgCtZ+9By1XGEOG1HEBh0YxBKpRrijKeMWPK7zR3iWqSR4CE/CBB1YglUt
 kV29jjEPNllE7SpxRzztEIrcnkVQRZm7mR/NHFHewRJCELJPzLWx3auUER2Xo5pH
 9jml9/DbS9LRPJoBagmN3E3qCnw+7t0e0ZHF+QY3VBuOB5YRq+gBPQ3ZuO8MqYrW
 pKwMwvB9srmzG+nVJNStb0fVPhyFefcH27xDKaNR4tqEjN3aliFs6eOBTDtHe1pl
 su5ybbA/2gmt/APBTDoTKwUQeHVapyhs8fIIcFOCxImjgfnaxZUf4BJRe//YKAZb
 X6oQnA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rn9s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 08:35:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9909853d264so101344241.3
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 00:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793608545; cv=none;
 d=google.com; s=arc-20260327;
 b=cYfYj1RXhSK2KzlYTys12OiI7NdY33sdhXNccbf11A8+/sEGP7qf7TNCavUBZeerWD
 U6ZvQXq7d4r5TU1VCrvjzm29mDWapInhGHLiVnAFS8oYM2Zo36L7osFp89JPrenFsaEG
 J0K4hxm0vn1qyCsD0MjsSK0OGn+9VUaXJ7ajpZ0E1QkM0U7SqTTwX69SQgm8Uf3IKaTV
 3Fb5ckENn7clxnV5HU7TisLGQ3jlwBa48lT7xYoeBMqoQTp/kbEQ8RrG7ub9LsV/OTae
 SGF32GQwD7iozhyS0pkml2mG6bAfsEGjV4ymv8nguXVuehYTNrUosqr+fZ9QVEjVVAjj
 2mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vQS0kP+1PxbcOYsLyS4eyBRzu/ad9CZ8F9mubaaroUM=;
 fh=E6BF16+v0xn5inoprnuVJHURbZVfNiUeJ4cjYAvJWE8=;
 b=DIHGyU8ogRJ2j2Wf6YTEne5btI9XhFxb+CWaROQcSgQMN51KHaxXCLHhjAim3U5BzW
 sJwl+Y5b6bSnv+e9RW7wbe1pkZNc6gpjAqCkRcjaK7tFlk7qMimyx+u7uq8V23kLTZZa
 X3BscK7lxY9GgMPSOjgtmVbT9DbPysJ+MDjwxdNaXf4oFX8sJ8t+SetGXcIZfBP/wqGH
 BUrr9H+JbnBTTyU24l87rJp4iDyGM0gl8T64NMCCb4qFORNaGCld+9OZ/I5tHNr064et
 PUVOr6WMqCbnLuT5TfBNGrupW81veuy0Ylre54CvaSiWCvkx3YQyA8buazhn8FEHXSWC
 hV3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793608545; x=1794213345; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vQS0kP+1PxbcOYsLyS4eyBRzu/ad9CZ8F9mubaaroUM=;
 b=WqryTYcNcOubzXrfSDHEdwSJ/J0qYyZDh84KweZlYThqOwz5msIIisXcOKuw17BkWB
 li70+2sSC2eguPqMK8uyc2CaPgfvbWpr9ghqOlBUk6/WCAUMofya0l8FGmdIYM7gbY1U
 hahOAeEdTj2yD7lOQJKv5C3EP845Nkmh59Hd3VOR9wwU9VwejZ65EfOCMVbBz4NMo1pM
 JmzIhEbr5ni/kQU6t/zfp9k64rz883V0RT639bwduvSDkvoZv6q/fOt0e6igFS32gyEv
 eC/k3LNX/6C2j7STLg5CJQ4Afpt8JDhBFeM5NVHVtKle3fOPpPROoV0xBKb/pRws72C+
 K81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793608545; x=1794213345;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vQS0kP+1PxbcOYsLyS4eyBRzu/ad9CZ8F9mubaaroUM=;
 b=ZwKiGWJf06bGJGuuyFjs645mXc9KrDw+u+guAcOyKQ0X5sRLLHOaC5bF1ToKD9Odsf
 /BJEIYZevTMAWRyB3DcxXKp8NAf1mFw1QV7Ra6BfDkNqEReBg6K/hBJtXuccdh9gfhEe
 id3dMGDkJ886ip4vKAQETRyYdc/2HPp8fwrP0gBgY7WOZKleJbAZKkgkUhdlgQT3Ozix
 4iGYkrGpN0/dy4f1ooWjw822uWAOqIrJa3ZtZ8UhapUrOT9j/cVIIpTbBgn5kbseahSc
 ueZi9jTINuMr94tqoSgGJkS00V3Axr8QfWtBlak9d1CUSCeEGntv356+R7G8wa7Yq+fJ
 2c/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoxpuKS/ocQJG+/zl8O6o2pD8jZ1ekfew/rvXXoU8FnAWeYr52KLyFI4snrCWdkl1jG7UHsxR7cSvN@nongnu.org
X-Gm-Message-State: APuU4Z+IhqAEZ6hboZgdz+I87b/bPSPDnOS9rAlMNOn0MBnJ3/E3wm7S
 HV8C6lijuoe/iimJJUSjduD1R4j9a+LXbLqXrXp3AT8Du+xOkd1oE4zad/0wNPdHB1PU1vPAJeY
 eUjOibwkCnWrONsTeoAtkLUUw+SO4z6Gw0i3A+bC/1sah58cw6RbCfRIVB0HOFLTfQ8SoqO7czC
 l+gofxtnp3QWGvMJbWFc3NgtGHhIQG7b7v
X-Gm-Gg: AYBFou0xgAw4oIfw6cbGnbEcw9tsRpv/v+3HY1rW5Xfe/IrYIACD8bNL1nkH3jph6KU
 z5jOXSMQ0sGqyMvJxpaKp5BmnJh8mWgGSM7EtNLFA0upE1Y9zmREwN+t4jrgEyZrFMlSx9xcdlJ
 Nj2CM1rRumtJYZBDB6UZqA+WhFZI25mJMmfdaRLEIxGHeTolRDqfcCY9fTLQ==
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id
 71dfb90a1353d-5ec6883359amr3796915e0c.3.1793608544839; 
 Mon, 02 Nov 2026 00:35:44 -0800 (PST)
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id
 71dfb90a1353d-5ec6883359amr3796907e0c.3.1793608544291; Mon, 02 Nov 2026
 00:35:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20261026132254.2652399-5-subrahmanya.lingappa@oss.qualcomm.com>
 <1d7953cf8d1a71f3e01939dee240f0cc74a368dc.camel@wdc.com>
In-Reply-To: <1d7953cf8d1a71f3e01939dee240f0cc74a368dc.camel@wdc.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:05:33 +0530
X-Gm-Features: AclHuK_GIH-Mq0m8nSUG7I61yV1_p3ZtSgekCn_TNFkZtig2tW7FHYdi9LggHuE
Message-ID: <CAPxK-6eWX4GFNW3XDyiw07USu-7xNmJ=pqWtzO6Qs6KNKOSSMQ@mail.gmail.com>
Subject: Re: [PATCH v12 04/10] hw/riscv/virt: add opt-in RPMI base support
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0kMOcn5cSTVvGpejWtaCxF6bnKq0lb2Z
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae84b62 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=JF9118EUAAAA:8 a=EUspDBNiAAAA:8
 a=2WmKsBWbf89lkljbXpsA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX7SD01n3DlzfR
 POvHqtDzmAFqznnajb6ukhungVADfZC3YkhNiY5c/Clw9jlYthSdnqGNwfCQvfaj46+nz8ggY+I
 o8JIJlXr8SyySJQj1fVXCDmp/efLOEV5M1PUVvpYSNuhNjDjXsNOkUTjZCZUxpGavK43pOPOZ1R
 KEcDEuGGwoVzLujnW9GNlHxA05Q9YPE95T9CKSb8jrmgCmNOfy0gG1oZD9tRPJoQuZK5nzBcxE+
 10lE2HBR6nCv9Gf2LijwaKpBW3Q+EUGgIY/c/1C9Mu2g0YAROT9EEJQ1XSeNeATKwewg6MWxQ8/
 9CCgPJgMHiZdPnCq2vO9iZ2SU88n3Ygl41VDIKUKnUjOHKFKGbhQc0kRPMBghk1GuwGrQjhuoMg
 hQRytKKwnW7u857+q1LmJxb16fQk+/jZGxtxCF1IxugyXkQyHNH7w/PuGaFReNWOcJBtnXi31uA
 51MkcPSI5eHzRa3SXrw==
X-Proofpoint-GUID: 0kMOcn5cSTVvGpejWtaCxF6bnKq0lb2Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX6h7CKdrmQZG4
 0VSXabx76WnON1T9j+JSfEHuOvRCc1kuFuuCOdwG+mS7yJjC9RuBLzOas44xXMLpjiP/6IC7nSy
 hIgIBM2gQQbX/70R9bM7eISDagIMzoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020034
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Alistair,

On Tue, Oct 27, 2026 at 5:37=E2=80=AFAM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2026-10-26 at 18:52 +0530, Subrahmanya Lingappa wrote:
> > Add the virt machine rpmi=3Don/off option and wire the initial RPMI
> > Base
> > transport into machine realization.
> >
> > The option remains disabled by default and requires TCG plus librpmi.
> > Invalid accelerator/build combinations fail during machine
> > initialization. When enabled, virt allocates the RPMI shared-memory
> > transport, creates the RPMI device, configures Base service metadata,
> > and emits the corresponding device-tree nodes for firmware discovery.
> >
> > Signed-off-by: Subrahmanya Lingappa
> > <subrahmanya.lingappa@oss.qualcomm.com>
>
> Whoops, I got v12 and v11 mixed up.
>
> See the reply to v11 patch 4, which actually applies to v12 patch 4,
> copied below:
>
> My review bot says (sorry about the line wrapping):
>
> - [HIGH] In hw/riscv/virt.c (finalize_fdt), the new else branch calls
>   create_fdt_reset, a symbol with no declaration or definition anywhere
> in
>   the tree at this commit. Since rpmi defaults to off, this is the
> default
>   path, so every qemu-system-riscv64/riscv32 build of this revision
> fails:
>   the implicit declaration is a hard error under -Werror, and the link
>   would fail regardless. A later series patch removes the call by
> folding
>   reset-node control into riscv_create_fdt_syscon, fixing the final
> state,
>   but every patch in a series must compile on its own or git-bisect
> breaks.
>   Move the reset-node handling into this patch or drop the else branch.
>
> - [LOW] Commit message for hw/riscv/virt.c rpmi option overclaims and
>   under-justifies. The RISC-V subsystem rules require justification for
> new
>   board features, but no use case (e.g. RPMI client or firmware
> testing) is
>   given. It claims the patch emits device-tree nodes (plural), yet only
> a
>   single mailbox node is added here; service nodes arrive in later
> patches.
>   It claims the option requires TCG plus librpmi, but the code only
> rejects
>   KVM and non-librpmi builds, never positively requiring TCG. It also
> omits
>   that the reset FDT node is made conditional on !have_rpmi.
>
> - [LOW] In hw/riscv/virt.c (create_fdt_rpmi), the msi_phandle parameter
>   receives msi_pcie_phandle from finalize_fdt but is never referenced
> in
>   the body, here or at the end of the series. Passing an MSI phandle
>   implies the RPMI mailbox is MSI-wired when the transport uses a
> doorbell
>   MMIO region; drop the parameter. nit: virt_rpmi_config(s, NULL, 0) is
>   called only to fetch shmem/doorbell addresses; reading s->memmap
> directly
>   would avoid coupling the FDT path to the device-config builder.
>
> - [LOW] In hw/riscv/virt.c (virt_machine_class_init), the rpmi property
>   description says only Set on/off to enable/disable RISC-V RPMI
> devices,
>   while the adjacent aclint property carries a (TCG only) qualifier.
>   Users discovering the option via -machine virt,help or QMP get no
> hint
>   that enabling it aborts machine init under KVM or non-librpmi builds;
>   add the constraint to the description, still missing at series end.
>
> Which seems to be true (I didn't test to make sure though).
>
> I see the call to create_fdt_reset() in this patch is removed in patch
> 5. Please make sure you test all patches before sending them
>
> Alistair
>
  Fixed in v13 patch 04:

  - Keep the existing reset nodes until patch 05, removing the dependency
    on later code.
  - Clarify the firmware use case and mailbox-only scope.
  - Remove the unused MSI phandle argument and read FDT addresses directly
    from s->memmap.
  - Document librpmi/KVM restrictions in the property help.

  Built every patch with and without librpmi, and ran tests at the patches
  introducing them.

Thanks,
Subrahmanya
>
> > ---
> >  hw/riscv/Kconfig        |  1 +
> >  hw/riscv/virt.c         | 97
> > +++++++++++++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h |  3 ++
> >  3 files changed, 101 insertions(+)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index fb05031228..dfdbc6dfe1 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -49,6 +49,7 @@ config RISCV_VIRT
> >      imply VIRTIO_VGA
> >      imply TEST_DEVICES
> >      imply TPM_TIS_SYSBUS
> > +    imply RISCV_RPMI
> >      select DEVICE_TREE
> >      select RISCV_NUMA
> >      select GOLDFISH_RTC
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index d4b501802f..3209e09e00 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -45,6 +45,8 @@
> >  #include "hw/intc/riscv_aplic.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "hw/misc/sifive_test.h"
> > +#include "hw/misc/riscv_rpmi.h"
> > +#include "hw/riscv/rpmi-fdt.h"
> >  #include "hw/core/platform-bus.h"
> >  #include "chardev/char.h"
> >  #include "system/device_tree.h"
> > @@ -101,6 +103,8 @@ static const MemMapEntry virt_memmap[] =3D {
> >      /* UART1 supports page isolation from UART0 */
> >      [VIRT_UART1] =3D        { 0x1000a000,         0x100 },
> >      [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
> > +    [VIRT_RPMI_SHMEM] =3D   { 0x10200000,       0x20000 },
> > +    [VIRT_RPMI_DOORBELL] =3D { 0x10230000,        0x1000 },
> >      [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
> >      [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> >      [VIRT_IMSIC_S] =3D      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> > @@ -464,6 +468,40 @@ static void create_fdt_iommu(RISCVVirtState *s,
> > uint16_t bdf)
> >      s->pci_iommu_bdf =3D bdf;
> >  }
> >
> > +
> > +static RiscvRpmiConfig virt_rpmi_config(RISCVVirtState *s,
> > +                                        const uint32_t *hart_ids,
> > +                                        uint32_t hart_count)
> > +{
> > +    return (RiscvRpmiConfig) {
> > +        .doorbell_base =3D s->memmap[VIRT_RPMI_DOORBELL].base,
> > +        .shmem_base =3D s->memmap[VIRT_RPMI_SHMEM].base,
> > +        .shmem_size =3D s->memmap[VIRT_RPMI_SHMEM].size,
> > +        .a2p_req_size =3D VIRT_RPMI_A2P_REQ_SIZE,
> > +        .p2a_req_size =3D VIRT_RPMI_P2A_REQ_SIZE,
> > +        .platform_info =3D "QEMU RISC-V virt RPMI",
> > +        .hart_ids =3D hart_ids,
> > +        .hart_count =3D hart_count,
> > +    };
> > +}
> > +
> > +static void create_fdt_rpmi(RISCVVirtState *s, uint32_t *phandle,
> > +                            uint32_t msi_phandle)
> > +{
> > +    RiscvRpmiConfig rpmi_cfg =3D virt_rpmi_config(s, NULL, 0);
> > +    uint32_t rpmi_mbox_handle;
> > +    RiscvRpmiFdtMboxConfig cfg =3D {
> > +        .shmem_base =3D rpmi_cfg.shmem_base,
> > +        .doorbell_base =3D rpmi_cfg.doorbell_base,
> > +        .a2p_req_size =3D rpmi_cfg.a2p_req_size,
> > +        .p2a_req_size =3D rpmi_cfg.p2a_req_size,
> > +        .doorbell_size =3D s->memmap[VIRT_RPMI_DOORBELL].size,
> > +    };
> > +
> > +    riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle,
> > +                            &rpmi_mbox_handle);
> > +}
> > +
> >  static void finalize_fdt(RISCVVirtState *s)
> >  {
> >      uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =
=3D
> > 1;
> > @@ -500,6 +538,11 @@ static void finalize_fdt(RISCVVirtState *s)
> >                              s->memmap[VIRT_TEST].base,
> >                              s->memmap[VIRT_TEST].size,
> >                              FINISHER_RESET, FINISHER_PASS, true);
> > +    if (s->have_rpmi) {
> > +        create_fdt_rpmi(s, &phandle, msi_pcie_phandle);
> > +    } else {
> > +        create_fdt_reset(s, &phandle);
> > +    }
> >
> >      create_fdt_uarts(s, irq_mmio_phandle);
> >
> > @@ -733,6 +776,18 @@ static void virt_machine_init(MachineState
> > *machine)
> >          exit(1);
> >      }
> >
> > +
> > +    if (s->have_rpmi) {
> > +#ifndef CONFIG_LIBRPMI
> > +        error_report("RISC-V RPMI support is not compiled in");
> > +        exit(1);
> > +#else
> > +        if (kvm_enabled()) {
> > +            error_report("RISC-V RPMI support is not available with
> > KVM");
> > +            exit(1);
> > +        }
> > +#endif
> > +    }
> >      /* Initialize sockets */
> >      mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
> >      for (i =3D 0; i < socket_count; i++) {
> > @@ -891,6 +946,25 @@ static void virt_machine_init(MachineState
> > *machine)
> >      /* SiFive Test MMIO device */
> >      sifive_test_create(s->memmap[VIRT_TEST].base);
> >
> > +    if (s->have_rpmi) {
> > +        MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> > +        const CPUArchIdList *possible_cpus =3D mc-
> > >possible_cpu_arch_ids(machine);
> > +        g_autofree uint32_t *rpmi_hart_ids =3D
> > +            g_new0(uint32_t, machine->smp.cpus);
> > +        RiscvRpmiConfig rpmi_cfg;
> > +        Error *local_err =3D NULL;
> > +
> > +        for (i =3D 0; i < machine->smp.cpus; i++) {
> > +            rpmi_hart_ids[i] =3D possible_cpus->cpus[i].arch_id;
> > +        }
> > +
> > +        rpmi_cfg =3D virt_rpmi_config(s, rpmi_hart_ids, machine-
> > >smp.cpus);
> > +        if (!riscv_rpmi_create(&rpmi_cfg, &local_err)) {
> > +            error_report_err(local_err);
> > +            exit(1);
> > +        }
> > +    }
> > +
> >      /* VirtIO MMIO devices */
> >      for (i =3D 0; i < VIRTIO_COUNT; i++) {
> >          sysbus_create_simple("virtio-mmio",
> > @@ -969,6 +1043,7 @@ static void virt_machine_instance_init(Object
> > *obj)
> >
> >      s->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
> >      s->oem_table_id =3D g_strndup(ACPI_BUILD_APPNAME8, 8);
> > +    s->have_rpmi =3D false;
> >      s->acpi =3D ON_OFF_AUTO_AUTO;
> >      s->iommu_sys =3D ON_OFF_AUTO_AUTO;
> >      s->num_sources =3D VIRT_IRQCHIP_NUM_SOURCES;
> > @@ -1044,6 +1119,21 @@ static void virt_set_aclint(Object *obj, bool
> > value, Error **errp)
> >      s->have_aclint =3D value;
> >  }
> >
> > +
> > +static bool virt_get_rpmi(Object *obj, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    return s->have_rpmi;
> > +}
> > +
> > +static void virt_set_rpmi(Object *obj, bool value, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    s->have_rpmi =3D value;
> > +}
> > +
> >  bool virt_is_iommu_sys_enabled(RISCVVirtState *s)
> >  {
> >      return s->iommu_sys =3D=3D ON_OFF_AUTO_ON;
> > @@ -1165,6 +1255,13 @@ static void
> > virt_machine_class_init(ObjectClass *oc, const void *data)
> >                                            "enable/disable emulating
> > "
> >                                            "ACLINT devices");
> >
> > +
> > +    object_class_property_add_bool(oc, "rpmi", virt_get_rpmi,
> > +                                   virt_set_rpmi);
> > +    object_class_property_set_description(oc, "rpmi",
> > +                                          "Set on/off to
> > enable/disable "
> > +                                          "RISC-V RPMI devices");
> > +
> >      object_class_property_add_str(oc, "aia", virt_get_aia,
> >                                    virt_set_aia);
> >      object_class_property_set_description(oc, "aia",
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index e516898f9a..919a664bc2 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -55,6 +55,7 @@ struct RISCVVirtState {
> >
> >      int fdt_size;
> >      bool have_aclint;
> > +    bool have_rpmi;
> >      RISCVVirtAIAType aia_type;
> >      int aia_guests;
> >      char *oem_id;
> > @@ -82,6 +83,8 @@ enum {
> >      VIRT_VIRTIO,
> >      VIRT_UART1,
> >      VIRT_FW_CFG,
> > +    VIRT_RPMI_SHMEM,
> > +    VIRT_RPMI_DOORBELL,
> >      VIRT_IMSIC_M,
> >      VIRT_IMSIC_S,
> >      VIRT_FLASH,

