Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A833CD8CAA
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 15:09:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wWy4l-0001fk-0V; Tue, 09 Jun 2026 11:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wWy4b-0001fT-1L
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 11:09:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wWy4Y-0001wN-8U
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 11:09:00 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659CnInW2668349
 for <qemu-riscv@nongnu.org>; Tue, 9 Jun 2026 15:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=XSJkJOkv5emanZXmVaBV5ypah2GhgL0GbaT9gE/zfj0=; b=aW
 YF7DKg4yapFbFb/23F9cDt8RYcBeYIiYu00sGX4f4VCY0o2eekhTu+uekWccPx1V
 mf5hcEUJ1kbPcN+VcOOtIdcc9AhVzBDaGEbpiWHbhgYe8HWgTA/gdlcjAT7LESC4
 0cuMcSMHjUXFwO7lzWnRFkHyTxI0iazRk+2939cgA0TF454KVn7/75YAKUH9DclY
 V9LFec8y9vygEM3MtZ2BVVKCTMirbOfTAUNv0sDPWMPmFNXj8ZtL2lxQq1EGirrJ
 4Ioh8ySpiatMtaKBht36/QDlaiTmeZwCYpEqqs0q2hoLEQMZS80JgrKcFpg/ZRtG
 CVX3+pp8THylqdPS6oOA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25t775-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 15:08:56 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-660f247c238so9894633d50.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 08:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781017735; cv=none;
 d=google.com; s=arc-20240605;
 b=iDO8MnFp8ReAwP77AC/s7CbmR2HlyIeycu1o2JLsZjTTXmfCSETi30B6C7H8NhCBfp
 Pxmnobb0DO74BXpUYvl98fAiqlOO6MfN9/5Sg/n5EQKmcVXOkmcIkMfMi+RDJC0rlPUL
 3PyOpqsDJa1LAcLXj3yG4lb+EchmvF6j+X9eBYr8+1JOT+7ZejcHSv44LVxQdmgphMeg
 EycF4hsNmEsuKEXMuNi+02WxpyzDoeHUKV9SnvxkADfAocP5QoFx1kwTk14yu1cN+76T
 M4jqzgX9DzVHeTaHT0JiwC5aM8oqH9qVl4hNjMIhTzzekG/1XzpGRF7Qruh726PSogUr
 k9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=XSJkJOkv5emanZXmVaBV5ypah2GhgL0GbaT9gE/zfj0=;
 fh=IG5XdgmvyfezsWrHGdfdbUcbMcXOdkYxmsdYvDFyac8=;
 b=EutulF1LPonO22NpwrJV7zQcUXMFBboZKq3POc7O3VHHLzPCJvbQd0zkcqpYpYzumd
 2hUROVcmXkdUoz1GEAdDVhFIJnYeW2t90k1nxezqBPZ7K3fUCWsgdyF1B14mB1oYKIwx
 2VLkhheL9OdpQnCIhXWAjuDeAQrRQfwiqFBvJ98NX6yW9qpK0SG9X7bp4Ap96oaJfauC
 wAYjxvClu/B/v4oh+TmFNP0jQQM6iiTmupaN6KYV+IHfrV097M03oL20VDc+0fX8SOEU
 llMUs902GpG8YYE4deRFxcZRQiQD90W5L8pwiAl8YmzlYeviWn0CoC1u9UJvDQmEB1UD
 FL5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781017735; x=1781622535; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XSJkJOkv5emanZXmVaBV5ypah2GhgL0GbaT9gE/zfj0=;
 b=DiP13Yez8EXlsXtOi4Figvm85K0kFg0+nzKsA2jLu2XM7KmuIcB6vuDz3CYgL1Pul6
 /aJ2WM4QGGGZYYdzWtFyBdioknkzfwHy+n1Hczee3UT1KMDJysw+uy/SXWRNrDVsbk07
 ek8MiO6I3FLlB958feKIs0iJN0+RxXdQfK374wU+Hf/VS7HT4D9Jol0sDKmETCQqTHwB
 pHWZzDrya07SE4tXX9U0FK42GwrwDUmabIelHbLfE2ahojgSaAJGTLDNSPO1MYHRCycq
 acDzDQdB5d2ZtjVnDJiYh1hZArC7cjOH7Q0wWdGPHeQie1pgfHM2BPgClDBt4W0o6stv
 zWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781017735; x=1781622535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XSJkJOkv5emanZXmVaBV5ypah2GhgL0GbaT9gE/zfj0=;
 b=tUjJqAnM81h1kJVYZADdFd2OQV5NocQTnNiztDppjBAq7+1FKdXi50iVvClviW7qqm
 apVadttKDzIxbUao6JJKCn7UYAMZieXkrPE3fD2Cscm5YbQ8sTYmrKn2XD8ooKRs8BS5
 3UyEVkXjS5E61QltHQvuobOybrL92PTGzxu9eEaS/E08Y78+DrhSWc8deqV+6o2xFwKU
 6FGSiOF2YbKaMLsgRDbry8xoQ3sCom/6oVylS9kBYht55dCl8owu9jlcfu92TCCBE4ic
 UclU6M+D8fMv5ymkAbwb2QK/9/vLVkamPlN8EklGJqe2nvkkA+EtrKYq1dIow6Ol7B5f
 WDRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8aMglkTCq/ZwwiY+8aEvsea7NeQmnjGqUEZc2yNm0BfMcwUPt6JknF0X+f3oD/t7oZwxrPE+hBTydk@nongnu.org
X-Gm-Message-State: AOJu0Yx2cVCzWNkcOrbSfO2C5AnC33uHdsED9J6RuUXrLwt3WCUbzBz0
 jAS9/aS9+4ctujPswQ4CVT8Jj2v4POuW5HOmZ3EvAE5bj1Huy67Ug3aEaJn0QfXVRKAp7/uGwMa
 acIosHFm2vcWj4p3VO7bcoOii4+UQ3FkdqroMutxPT8cwZOn7WXoJgsTLsud3pzXUFRK44Lqy/W
 0R193hSNXNuiMXzepY5yq+lrmco9kYK9SS
X-Gm-Gg: Acq92OF0t2go7PgatRJCjlw+BiZheXt0aqO2ud1bpGz89IdbDK2SchCFaOzhrOCyB0t
 CSx4VvEOyztAIEVZOZNirLOnABSiMeloWhmne6dPX03S/0eYGP94uR2ZULL0FVhZEsU/T/uDoSW
 oEtIWle912l0pjiE/xWhDrhDFOcJ4yguXT3Gm4zeke8zxDj0av0K0X+ht626vJkMQltI3o23pFt
 75gS6puWqk2d9J9AA==
X-Received: by 2002:a05:690e:169e:b0:651:bb21:e7fb with SMTP id
 956f58d0204a3-66106fada73mr16754328d50.54.1781017735477; 
 Tue, 09 Jun 2026 08:08:55 -0700 (PDT)
X-Received: by 2002:a05:690e:169e:b0:651:bb21:e7fb with SMTP id
 956f58d0204a3-66106fada73mr16754286d50.54.1781017735028; Tue, 09 Jun 2026
 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260602074127.63819-1-cp0613@linux.alibaba.com>
 <20260602074127.63819-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260602074127.63819-3-cp0613@linux.alibaba.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 20:38:43 +0530
X-Gm-Features: AVVi8Cdle_VEyRYddsF24uH6tQLmZBOOPx2_3oluXiglzFIVuBVf9t38z5J41_M
Message-ID: <CAB19ukHaz0xJrL7-WSdMaK+Sodk1mgbim_L=AQdsPaLg4Pf44g@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv/virt-acpi-build: Add _DEP to ACPI0017 for
 CXL host bridge dependency
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 sunilvl@ventanamicro.com, jonathan.cameron@huawei.com,
 fan.ni@samsung.com, guoren@kernel.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qIMNF9U0aLFeiVQSEG287JWHkU-sZiMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NCBTYWx0ZWRfXzKPDayyf1lHa
 tsqMexMgEarpPQzUqFVECPgp7NboDOrvLBIvdC63htoaNy8JjtemL+7zIsB4cjru6ALeaM1Xmlv
 ucvIMsYB9z5rtFeD1iXb4dbaNyZ0hJP2nLmIbXHMKjCX5SLAEr4Pfm09Vx0vIjI8ejyxaI0p3lx
 dyPKJ8chkRYu6c1P8i64od6K/6Y8/xYsaj6fsCuJO1q9Wq4ZNVD2bZCq+jywkgGdgaPMHke0q3u
 pzwaV/0pSMEYPldWJ6iTGO5eHzN385pID0ncwHBGu9CRhx6H3Jg1Zp8fTN3WGCb24mfwCsMFqAN
 p4a6Z+2Sa2O4ihAJmGd5Lg5kJ29XbWCcgNKCNJgEVM3YtB9tX+mIwIfrEabHMm2ASlI05el6vr8
 minWRODWUQNq+dnrsGbQfDOjxnhs/rHScsALTWFM4tDDoTFPbwjqi2xVwD2Wresbk9B6QLEq8I4
 hhN4n2LWo4j3yx9FWng==
X-Proofpoint-GUID: qIMNF9U0aLFeiVQSEG287JWHkU-sZiMH
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a282c88 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=65xJDWIeJbAoLFq9lykA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 2, 2026 at 1:18=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com> =
wrote:
>
> On RISC-V QEMU virt platform with CXL enabled, the probe ordering
> of acpi_pci_root (ACPI0016) and cxl_acpi (ACPI0017) is not
> guaranteed. If cxl_acpi probes before acpi_pci_root has attached
> the CXL host bridges, the CXL port topology will be incomplete
> because to_cxl_host_bridge() silently skips devices whose PCI root
> is not yet ready.
>
> Add a _DEP object to the ACPI0017 device in the DSDT, declaring
> its dependency on the ACPI0016 CXL host bridge devices. This tells
> the OS to defer ACPI0017 enumeration until all ACPI0016 devices
> have been attached by acpi_pci_root.
>
> This requires a corresponding kernel change to call
> acpi_dev_clear_dependencies() in acpi_pci_root_add().
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  hw/riscv/virt-acpi-build.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 309d64b322..a5bafd1dcf 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -510,6 +510,38 @@ static void build_dsdt(GArray *table_data,
>      if (s->cxl_devices_state.is_enabled) {
>          Aml *cxl_dev =3D aml_device("CXLM");
>          aml_append(cxl_dev, aml_name_decl("_HID", aml_string("ACPI0017")=
));
> +
> +        /*
> +         * Declare a _DEP on every ACPI0016 CXL host bridge so the OS
> +         * defers ACPI0017 enumeration until acpi_pci_root has attached
> +         * the CXL host bridges. Without this, cxl_acpi may probe before
> +         * to_cxl_host_bridge() can resolve the PCI root and the CXL
> +         * port topology comes up empty.
> +         */
> +        if (s->bus) {
> +            PCIBus *bus;
> +            uint32_t num_cxl_hbs =3D 0;
> +
> +            QLIST_FOREACH(bus, &s->bus->child, sibling) {
> +                if (pci_bus_is_root(bus) && pci_bus_is_cxl(bus)) {
> +                    num_cxl_hbs++;
> +                }
> +            }
> +
> +            if (num_cxl_hbs > 0) {
> +                Aml *dep_pkg =3D aml_package(num_cxl_hbs);
> +
> +                QLIST_FOREACH(bus, &s->bus->child, sibling) {
> +                    if (pci_bus_is_root(bus) && pci_bus_is_cxl(bus)) {
> +                        aml_append(dep_pkg,
> +                                   aml_name("\\_SB.PC%.02X",
> +                                            pci_bus_num(bus)));
> +                    }
> +                }
> +                aml_append(cxl_dev, aml_name_decl("_DEP", dep_pkg));
> +            }
> +        }
> +
>
LGTM.
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

