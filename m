Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153AFC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 04:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgafx-00075M-0N; Mon, 06 Jul 2026 00:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgafl-00070L-W8
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:11:12 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgafj-0007yL-It
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:11:09 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-697564cb69eso4972551a12.0
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 21:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783311066; cv=none;
 d=google.com; s=arc-20260327;
 b=OWHoz0H/bdJvKRKRHbQpJKDdFMpPZO+B7T2Td5xPj3tmiok/ciXulSoa2kvM4UdGKE
 z887KfjIZj3LUG8PbtgYZn43vkvELfIoFuMZbJ9NeuSteNPykjN8DI/Um51B32B/ViBw
 2M19f17HKGLmZ2LcUBp4ynfdA2H6TaeUTUxOjU009FZ1Stq6Rv2+PHwx0Js63VQ+qR04
 8pAppSB+QYz72ow/w5s3shBPUQ5I1GhQVkc5H08ynNbr+lN4cgQ8Yw5jeAXfSuChTy5b
 iuTdgr4PrApvRnk+ASoMHO/4/pISFxYfYgbcXrkhqwPr7dukTWaHDiLQh8NkJbg8SxKl
 welg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7HxEleNdpcq/puEELEg1OY61bl0n76N0fS35a2/nEw4=;
 fh=SaJJnHiPltWyyAkeZq9yaoSXHbr7hGC6MJFo+CLaeWM=;
 b=XdCNdqJDkpN59j3bHzj10mEYxjzbYffV1kaxije0JU06saRXpmqq/8ynSailJQERCa
 5d4JfOz1Z+UfP1WybWU15PzNTJ5iJTbH2+FNOsLMW9y4nj4fL018EHD47oatfGbUcs/d
 hkxqpSKmB9d/MPpI/S3Tdydpsp+uUzwzEQrXI0ZYiQVTXFxqXvygtckGs1mtGf4Nemgn
 vz+8/Ay1AW+7Iq8HO49WySA862M2QSKXRRnJ2ZsX3kWFDQYP3ysAOw2e0dqUwzD61hEi
 LxlxBnVP3cNfY2iDRurtIoyfjEPDsOmOJtMZGJvh44XN+yk2xPVLOM6WviEf3Tzfh9wv
 fcqg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783311066; x=1783915866; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7HxEleNdpcq/puEELEg1OY61bl0n76N0fS35a2/nEw4=;
 b=Ye4RIcov7KsOEp1XdCkXVcCCqJ50gK4BWzi1cB3maDQKXnA67ec4zcskCRsr0AObCp
 TYYPJ4VjBhHmv5agq3QcfeWiu+bDAa0jR2qgMofDDZ4BX0Kclwu612Dc6LAaR1tDdAZo
 Nea+4xhAPogRMtnGEZbXaT87fSfolOnC5jVTQlixZeyLexuUs+FWxFUAIub8KGQ393op
 Gq19Qd/mePnQmT+Pg4aKcrgYL0qXJ6YwXQggRvq+MUNh0MNXjsY2J5h4mNN1xSfKtXE8
 9oKfMQ0BhyBlNluO0Tfdmgho6xdPNJ2ejqCXFPElvo5sgkPsOtE4sAVW/FhX+baicqJM
 54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783311066; x=1783915866;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7HxEleNdpcq/puEELEg1OY61bl0n76N0fS35a2/nEw4=;
 b=okqPubUu4DvrA+73WVLlUwBMyVR6EHzUhyFFUSfUmErzMJ+Kix01+ZtKPECj8jwzEV
 g4IJF4LtacMPvzlLmrili4Hej1e/KMzGy648xjnGqfXuAlHSAZTbqqdkFzzl1nGiVRe9
 42LurnT8aOJmKPD5OgoJz/6BJR6qHbX8iXcVw2uSxdK018DQdrWceJfAKomFrQ2dXDuo
 PbQDH9y5EAh6ayT7YKHiraj74cGeLzhGk3/lyHpSjKWSLvT5bg4om2kSgJPTOHWHk08G
 anpOrxA4kuPaYoOcN+1PvXILEo0hTDeUM0daQte+K7btamh95Vmrwwk4tsdy5AOQvva1
 elBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqA05lMtW3niPswcXWMit/4HmZuMnNvT/cGbLZP7usDxhd4zmOMz0MYrGK2EhAuVyrQFn2P97onylrY@nongnu.org
X-Gm-Message-State: AOJu0YzL5JLZuHoWi6aWRf7SryAHjXYA9C6GtuDBPEF09U47nfAfAa0I
 2QTSFrj9PCW3sqYMeMNTfvRJs1M7i9Mxo+YVmiDYAA1vR92f3PUOX7MUdvvug5ehgBuISi5DY9e
 wgktatK3K2cSelAcUcSknYCuVJicYBbY=
X-Gm-Gg: AfdE7cmVl/ADBlx4PLSFKSdh20t4vZEW+1iRHk/iCIieszX7aqdSKgrV1fQ0y69q8fJ
 WdaGxTtN7uQcaPT1T/sRscOtU+o7BM9RbTHnIhdDosqO27lyJzaJY63xafed5S/PTlb64E9W60r
 bQI03U5hTOICbvrJ3pdgqgNtjzCFk/CN7wjZpsiGtaRyGd4H2eyn3Yd6d2Ctx3q0R7qBVy+Xvph
 jNUSCkYGk1FDk7grSRzkrVVBVz1SKU7mZeBUrGP3kYj4aILKflv91BJ8rYKXMaX31i3cJygixQa
 pgeDwzYOmz8dwJUwhjewYtLJElq2XVigniqNNA==
X-Received: by 2002:a05:6402:3908:b0:698:3e99:815a with SMTP id
 4fb4d7f45d1cf-69a1a4c094bmr2715772a12.38.1783311065710; Sun, 05 Jul 2026
 21:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260618093827.3507-1-cp0613@linux.alibaba.com>
 <20260618093827.3507-5-cp0613@linux.alibaba.com>
In-Reply-To: <20260618093827.3507-5-cp0613@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 14:10:39 +1000
X-Gm-Features: AVVi8CdAeWtetyAQk_qrrsZ1ircuBVcHeYNWKbPeiByd5CkQfkXfp2U6MM-auzE
Message-ID: <CAKmqyKP1DUuLBxLhsqVXa8Bsk_x_r=rg+-08dOg46fkEO2W0rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] tests/qtest: Add RISC-V ACPI bios tables test for
 CXL
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: jic23@kernel.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, sunilvl@ventanamicro.com, dave.jiang@intel.com, 
 alison.schofield@intel.com, imammedo@redhat.com, mst@redhat.com, 
 guoren@kernel.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
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

On Thu, Jun 18, 2026 at 7:39=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> Add test_acpi_riscv64_virt_tcg_cxl() to verify that enabling CXL on
> the RISC-V virt machine produces correct ACPI tables, including the
> ACPI0017 CXLM device with _DEP in the DSDT and the CEDT table.
>
> The test boots with cxl=3Don, one pxb-cxl bus (bus_nr=3D12), a CXL root
> port, a cxl-type3 persistent memory device, and a fixed memory window,
> mirroring the existing x86 q35 CXL test pattern.
>
> Since pxb-cxl is a root bus, using -cdrom causes QEMU to auto-plug the
> cdrom drive into pxb-cxl, triggering "Only PCI/PCIe bridges can be
> plugged into pxb-cxl".  The ISO is instead attached explicitly via a
> virtio-scsi-pci controller on pcie.0, following the same approach as
> test_acpi_aarch64_virt_tcg_pxb().
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/data/acpi/riscv64/virt/CEDT.cxl | Bin 0 -> 108 bytes
>  tests/data/acpi/riscv64/virt/DSDT.cxl | Bin 0 -> 6212 bytes
>  tests/qtest/bios-tables-test.c        |  54 ++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 tests/data/acpi/riscv64/virt/CEDT.cxl
>  create mode 100644 tests/data/acpi/riscv64/virt/DSDT.cxl
>
> diff --git a/tests/data/acpi/riscv64/virt/CEDT.cxl b/tests/data/acpi/risc=
v64/virt/CEDT.cxl
> new file mode 100644
> index 0000000000000000000000000000000000000000..81d746dfb09ccb147e26bb640=
60404ca3191d097
> GIT binary patch
> literal 108
> zc-nJzbqUE~U|?VjaPoKd2v%^42yj*a0!E-1hz+6{7!(+IKx!BefCEf2LP-snumA^?
> O0aMEg#QH!C(hmS*@&^F`
>
> literal 0
> Hc-jL100001
>
> diff --git a/tests/data/acpi/riscv64/virt/DSDT.cxl b/tests/data/acpi/risc=
v64/virt/DSDT.cxl
> new file mode 100644
> index 0000000000000000000000000000000000000000..45999636a05a16f68d1f418a5=
8d9b80a8a62c9bd
> GIT binary patch
> literal 6212
> zc-pO)%WoS+9LHzvjqR-0&f0Mj=3Djrqzae%_tantltHTF7bT*Zm;rVlBV91*2z8`P#y
> z5CtJh4?H3sYJ<3NaYa=3DA0Zs@65?r`dLI_kOZd^FR0U;rUnO)o2Z@QIw$VS?ovFG=3Dl
> z`E1tSkGJfUm&#coLJv!e_M9_bI$yKL<)#TCR9hXbkKfiVG@Mdn`SzS{1Bf-|D&<7c
> zu2p1bO2isxDrLE^7MD^_8HclnHKEG<+ur{2?c=3DlO>{&19`I+h&88jgyoTZ`>k2P$&
> zsL6fZNu`YBJKd_>vg9hoO<6frvD-_iJN8*wneQy&lv5IW3WX`eid$$$?Zqlr7CM!x
> zX2=3D+5)mUo(ene=3DR;m#Usl$~;VB9!Vitjw=3DF55KzlL3Q)a*PnfR`g1KktfjM|#OjOJ
> zR@aYQd};0aD{EI*Z^~(>kIPAm`q_GWx$_J4MLFr@?xY>g_SBa9=3DS{7(fZd3EP=3Dpo~
> zG46{9wIWI?Vj?KQ2nA)pml5`76aq8CK^fD&4Bek`G%!OC%BcA=3Dy8IcFff-#v87sbw
> zh(F_4U`8Y;W5bsb^=3DC{4W<-NBZuv4|t&EC354&}B)D~*8J=3D?iBYO*$I#NF}Zt*g*}
> z<h4ws;nW?i6_pQ&(m3isK-2+_I<2B60;1H#;?Fu5kaaL1s}PhG=3DBz^jS%)}l_QRSD
> z+yCv8Kc*@w<+K?xiw}&L+R5BfX~8hPSxoh%Qcn#U{Tt#n@q+wxl*O8ORa_RU@+dkV
> z!diW)cm8GLRywZ7cXovOw+OGTsq-q*rfM4@b!OU~utF2*gl@`FLU`j^J<S`K^m=3DYx
> zVYeIh^4+l^w{oJ>(|kiiUL|(BVc#rax3bXbX}+OhuQI>e4f|%%h48IF7n*OVF4~ms
> zuAj4uIJ=3D0mi#fZPGeVpZ;*2n7ggK+c870mrb4HmnMw~I?j4@}7IlGCon>f3fvzs{$
> z;xvfUU`~TM<HQ*!&Ny?%nbRarlQ>Q0G?_C&oC)GgFlT}}lf;=3DM&LndtnX`vDdx*1#
> zIeVDXB2J4qE#|bCGew*!;!H7TiaFE7nI_IObEcWImpFTgvzIx0nKMJ28RE<^XNEcZ
> zh_jD4`<SzjIs1vTpE&!Ov!6K!h;x8A2bgn!IkUu>CC)5!W|?!4I0uPykU0mLbBH*H
> zh;xWJhnRDiIERUIm^p`;bA&iYh;xKFN0@VzI7f+dlsQM4bBs90h;xiN$CxumoH^pm
> zF=3DwvL>D{=3DWGoE=3D@UJYj3_cwNScHU~Wt@jclWV%8=3D>?*dr+dF4!H4(Fy>ho^fcH6e=
d
> z%qJU*j;(L53%h(S-&`>7Y+X|By<GjR@K0`J`qOhair=3D01<)Zg${O7+eUH)OS`pt<?
> zhOCo6{kOSp=3D(27?9%J%Y*igHbH&%??O4GW#by<5;rMmCso4t3p+_$~gEVWnTC)Cp1
> zLbbY$71e5%^~X+V$^l2^Q3Xt@x}%CmH6|63N}tr!ZhQS+(wj@IF~7a;sT=3Dms0<nJ<
> zh<&s`?3V@Jt=3DSdd*(&0=3DCxNY=3D`c3D|oD!}EcFv=3Dcz??Bs6Sk;G@f(*vah_NO;Zs5=
Q
> zRS<p^1gRiM1;Hu^RzZ*of>aQ!f?yQ{sUS!N!72z=3DL68c9R1mC!U=3D;+ZAV>wlDhO6V
> zkP3oS5Uhe=3D6$GguNCm+v2v$Lm3W8J+tb$+_1gRiM1;Hu^RzZ*of>aQ!f?yQ{sUS!N
> z!72z=3DL68c9R1mC!U=3D;+ZAV>wlDhO6VkP3oS5Uhe=3D6$GguNCm+v2v$Lm3W8J+tb$+_
> z1gRiM1;Hu^RzZ*of>aQ!f?yQ{sUS!N!72z=3DL68c9R1mC!U=3D;+ZAV>wlDhO6VkP3oS
> z5Uhe=3D6$GguNCm+v2v$Lm3W8J+tb$+_1gRiM1;Hu^RzZ*of>aQ!f?yQ{sUS!N!72z=3D
> zL68c9R1mC!U=3D;+ZAV>wlDhO6VkP3oS5Uhe=3D6$GguNCm+v2v$KkOU7*2rJ~qYt_SZ{
> zJ{L7^wDnJjxGRAqiqldQueI8c?`USY{j6Btg4GsQPmwpD_SLwX?v8M83}Wx=3DQX1x?
> zERtQp9{E^f9D71zbp7z2Nn)2d(kMGsy?MZ!^TE`Qe>jt`SMLn`Ssnb|t~R^3u88ea
> zSo3zvx2t-6#vu)CYjwfEBjoVT&Cba^;Ff4VTa4J}=3Dd1LzOg*bF&(zYUcHvp|Kwmvh
> z%XF)!?qb`BXQtG8%_h9{-v4*)@87?;K7Ienmu7tNqk3n(S~IzIMcYotLRwmvlJY;~
> Cu_#Oc
>
> literal 0
> Hc-jL100001
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 510751799e..4625b76692 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2194,6 +2194,56 @@ static void test_acpi_riscv64_virt_tcg(void)
>      free_test_data(&data);
>  }
>
> +#ifdef CONFIG_POSIX
> +static void test_acpi_riscv64_virt_tcg_cxl(void)
> +{
> +    gchar *tmp_path =3D g_dir_make_tmp("qemu-test-cxl.XXXXXX", NULL);
> +    gchar *params;
> +
> +    test_data data =3D {
> +        .machine =3D "virt",
> +        .arch =3D "riscv64",
> +        .tcg_only =3D true,
> +        .uefi_fl1 =3D "pc-bios/edk2-riscv-code.fd",
> +        .uefi_fl2 =3D "pc-bios/edk2-riscv-vars.fd",
> +        .ram_start =3D 0x80000000ULL,
> +        .scan_len =3D 128ULL * MiB,
> +        .variant =3D ".cxl",
> +    };
> +
> +    /*
> +     * While using -cdrom, the cdrom would auto-plug into pxb-cxl becaus=
e
> +     * its bus is also a root bus, triggering "Only PCI/PCIe bridges can=
 be
> +     * plugged into pxb-cxl".  Attach the ISO explicitly to a scsi contr=
oller
> +     * on pcie.0 instead, following the same pattern as
> +     * test_acpi_aarch64_virt_tcg_pxb().
> +     */
> +    params =3D g_strdup_printf("-cpu rva22s64"
> +                             " -machine cxl=3Don"
> +                             " -device pcie-root-port,chassis=3D1,id=3Dp=
ci.1,bus=3Dpcie.0"
> +                             " -device virtio-scsi-pci,id=3Dscsi0,bus=3D=
pci.1"
> +                             " -drive file=3Dtests/data/uefi-boot-images=
/"
> +                             "bios-tables-test.riscv64.iso.qcow2,"
> +                             "if=3Dnone,media=3Dcdrom,id=3Ddrive-scsi0-0=
-0-1,readonly=3Don"
> +                             " -device scsi-cd,bus=3Dscsi0.0,scsi-id=3D0=
,"
> +                             "drive=3Ddrive-scsi0-0-0-1,id=3Dscsi0-0-0-1=
,bootindex=3D1"
> +                             " -object memory-backend-file,id=3Dcxl-mem1=
,mem-path=3D%s,size=3D256M"
> +                             " -object memory-backend-file,id=3Dlsa1,mem=
-path=3D%s,size=3D256M"
> +                             " -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,=
id=3Dcxl.1"
> +                             " -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3D=
rp1,chassis=3D0,slot=3D2"
> +                             " -device cxl-type3,bus=3Drp1,persistent-me=
mdev=3Dcxl-mem1,lsa=3Dlsa1"
> +                             " -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.=
size=3D4G,"
> +                             "cxl-fmw.0.interleave-granularity=3D8k",
> +                             tmp_path, tmp_path);
> +    test_acpi_one(params, &data);
> +
> +    g_free(params);
> +    g_assert(g_rmdir(tmp_path) =3D=3D 0);
> +    g_free(tmp_path);
> +    free_test_data(&data);
> +}
> +#endif /* CONFIG_POSIX */
> +
>  static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data =3D {
> @@ -2888,6 +2938,10 @@ int main(int argc, char *argv[])
>                             test_acpi_riscv64_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/acpispcr",
>                             test_acpi_riscv64_virt_tcg_acpi_spcr);
> +#ifdef CONFIG_POSIX
> +            qtest_add_func("acpi/virt/cxl",
> +                           test_acpi_riscv64_virt_tcg_cxl);
> +#endif
>          }
>      } else if (strcmp(arch, "loongarch64") =3D=3D 0) {
>          if (has_tcg && qtest_has_machine("virt")) {
> --
> 2.50.1
>
>

