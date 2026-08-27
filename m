Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FCCC61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzY1c-0000pN-Pd; Thu, 27 Aug 2026 07:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzY1b-0000ot-5z
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:12:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzY1Z-0005mM-H4
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:12:02 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9HkIT3643648
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qvIcYuhstM2ZrFXvlYQNf1rO7XRW7zaT6bI9KsiFqas=; b=FZCNC0g+KfCLi8IP
 hvhs9ZOYJKd1zBCmB5vhV4Uxv4MjM7PJ3+05MRi3yws2iHZ2gp+4hXwkrSa8W5px
 t/IL7dkzte3Ys4GSrtg3GVbzWgm9YfbhV7fnpH8Ywb2VZZ6L2WJL6Da0kn+DNf0m
 7xvRHtiCsR7/65pp/Yp7Eg5ows50LsxoDt3kRhiKHYxWdE0RTNnVyNc82epaztfu
 bAQvv0DFI24rVN1DiqjJlbaoN0DhN1IgqXY+XMRNcCLjK3NwYU0T+QNR7a9UcH22
 RpYubPL/haD51IdxPITiuHqsIeCgKBHGOe7SCX31tdEmYfPeYAWcPiRdvs8kEMUN
 6LXdcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecbdd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:11:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e62e3459fso185027585a.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787829119; x=1788433919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qvIcYuhstM2ZrFXvlYQNf1rO7XRW7zaT6bI9KsiFqas=;
 b=JdCJLY4T1HKEMnde9IHFJNkJ8IriwoMTCC/vh9NkD+1DdwoNfMS7UMEjFApCpz9nBN
 AiN1OUcZmcyGNINHuFmemnZ2iFKPzvhoTU7l67i6Gg9aQYTGV7Op2dnqGwkb+IoE82Bq
 tknaRws/btzs41jtYRgklFDynxbsFF/w+k8ZmdMv4QCJ90u26drCOJCYhfWyZPOcACS3
 1JdnvxIUmulJSydVyhZ7xLVftBMhZCVzs/Qpyaein3F1iWtzzjSfIa5cErLHGk3K3UdP
 BtW4eYZHs65UxXkNgSM/JDDGkz96yrxxETP/w2e9dunLTYnKLvWftOS7OeSTn1dB+uEd
 R1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787829119; x=1788433919;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qvIcYuhstM2ZrFXvlYQNf1rO7XRW7zaT6bI9KsiFqas=;
 b=e5aPt8HOOMKyuyy/UQBDAIBwF2CPtbcEnw8AbprCatmv0daj9hvbiOt7SbtCWIqtDV
 PCEM0N8mgya1VBE0XYbNsVkFkrigtWGX1vO4LmH7D1PDCoIaCQVLpF+jr34GWRfw6YKl
 Tf8eDZlRurgPOsjjlyEQFfItpwCn7e9L0utiIWcir15pkv/7Aq7bly777x/MW/MqovCA
 oIHi7bn65yDUsRni1GbywaQOwKyTW5z3cCPq6ntqRFNgqn+LL5ddzl6s2h4KzPothaTy
 dauxubYCYC4jDu5FyrGpK6t1R4k95PNdF8z+bcnJUW+c2rsll1R95gSdr/7DyTL++uM9
 2vDw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOZOHndb7q769GHLrqfpKS092rG/GwcqyPcAxikvQNXhxZg7qec11y2QayR1EY/v9NIVMX0PFXeXFM@nongnu.org
X-Gm-Message-State: AFuF++lNSqPwxbnEXrlMiO/T+dVxiswwiMvdyYA+cVsUzebSA7MfbX6U
 /7fRfx5i0G55Tq/rOa3Xyh04ySOJn0zp0REuGc6MSPTZk27jrbqwkC4A30SwDGvWB/Mvs/VC4MZ
 zRomtRCjSV1OOVTgkVihhUuTmifOYFCSyB9zrdCYUkyA5H2wndCl/0Ojtww==
X-Gm-Gg: AR+sD13AcrbZFkcLHY9AQUtIN+2F8eA5zi5iupxoix8qa013oCxT6O0YuJnGYMp73Mx
 MCCLZ1FQDFjQFB1z8jQ25DNjWxm2rWQj9NePwUyd5iH/AqruY/be36/S8qelRphGSfoUFIwW9S5
 IH/JfEZusyeun3VdiMgL+02CUQizFRxVcYC1PvZC83rabsUeEo5raf8vLi/CAYFKk2Iv82cIgSh
 2qxfxVJu24rFUvdfVSzqLDFGeTFom3EVpVZyaKcrRYjG2QvuYvb39+unrkJJLy2d3xJW65pbRO0
 wnRbYebzMSbk0A45X6dNOe+PN6Z3YeYtj90mNTGo06aWoR0XLwU3mFlG3bUSJvqDA72vxhuAreY
 JFZyweb0lswkvCEuoq1W7BQ7+TDiDbW8ZyvNF
X-Received: by 2002:a05:620a:a918:b0:938:fddc:3d8 with SMTP id
 af79cd13be357-938fddc114dmr646397685a.19.1787829118755; 
 Thu, 27 Aug 2026 04:11:58 -0700 (PDT)
X-Received: by 2002:a05:620a:a918:b0:938:fddc:3d8 with SMTP id
 af79cd13be357-938fddc114dmr646390385a.19.1787829118322; 
 Thu, 27 Aug 2026 04:11:58 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e30f097sm425095785a.1.2026.08.27.04.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 04:11:57 -0700 (PDT)
Message-ID: <345afd44-1524-4175-aa47-08684ab73f94@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 08:11:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] hw/riscv/cps: Map interrupt controllers in SoC
 container
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-7-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826220528.54516-7-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a901b7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dTGOgC95JIJbKO-HG_0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZboED2g1Kdv2ElRF3d29-yKilgKcpUf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5MyBTYWx0ZWRfX0oMmJEdLeSXY
 JgcOXxsGzBA22aU+eB8XSkIzb4KbBJS+nuOVtZI8Acpnx0vMi7JSXnxL297mhS/r9v8vGDpjXKp
 sx+/Rexs1cUsxOz/JamaxjqrMoYvOYYG0fQ3DYwiiR7vd/g394sDak4v2AbrO2G1/vXIS8Ko5Yz
 d9KElybRhpkrxBT+RULwVT17Qemf4QtOeZ2yxtzHUuFSY52w/ysdaR/0kTRWfQBikMt7E001nHV
 fBDwSVYw8lNK3RNSujXH8IRWARv8SWvfAgypxKJcg6Iv5V1Dh49wAwtao2Tf9ldUtd6FCsJwzGv
 sCDaSKt6jFjutjKf/THB8uqqmF2kHDcucxxUX+966mgiQXeDCfVd50XYQSjVmgGfTwuWEPXFPne
 zrBi9nebW7A9D5LbfVSZ0Dy6Ruyie6gk/IbEZXSae+oKd9OdtuK4OvNLQg7GOrPNmXqoA57yPch
 v1spwQr2NGeMSFiB3LA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5MyBTYWx0ZWRfX24u5qm1tUxT1
 rFZJXG2svoVrjW7FLu4BojyrFuXfTSzmLNt/zmK/oZ4lyW68efyCw6tQDt387UWoLP6Fy5reynB
 GOvE/jhCmNJLCPyqsS6eUeAUE5+gaF0=
X-Proofpoint-GUID: ZboED2g1Kdv2ElRF3d29-yKilgKcpUf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/26/2026 7:05 PM, Joel Stanley wrote:
> The CPS device maps some devices into a container region, but the
> ACLINT and APLIC were mapped directly to system_memory.
> 
> Pass the container memory region to the interrupt controller helpers so
> all CPS devices live in the container. The location of devices in memory
> for the boston-aia machine is unchanged.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/cps.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/cps.c b/hw/riscv/cps.c
> index d2fd9638a08d..21daaf4943d8 100644
> --- a/hw/riscv/cps.c
> +++ b/hw/riscv/cps.c
> @@ -135,7 +135,7 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < num_of_clusters; i++) {
>           uint64_t cm_base = GLOBAL_CM_BASE + (CM_SIZE * i);
>           uint32_t hartid_base = i << MHARTID_CLUSTER_SHIFT;
> -        s->aplic = riscv_aplic_create(get_system_memory(),
> +        s->aplic = riscv_aplic_create(&s->container,
>                                         cm_base + AIA_PLIC_M_OFFSET,
>                                         AIA_PLIC_M_SIZE,
>                                         hartid_base, /* hartid_base */
> @@ -143,7 +143,7 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
>                                         APLIC_NUM_SOURCES,
>                                         APLIC_NUM_PRIO_BITS,
>                                         false, true, NULL);
> -        riscv_aplic_create(get_system_memory(),
> +        riscv_aplic_create(&s->container,
>                              cm_base + AIA_PLIC_S_OFFSET,
>                              AIA_PLIC_S_SIZE,
>                              hartid_base, /* hartid_base */
> @@ -153,10 +153,10 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
>                              false, false, s->aplic);
>           /* PLIC changes msi_nonbroken to ture. We revert the change. */
>           msi_nonbroken = false;
> -        riscv_aclint_swi_create(get_system_memory(),
> +        riscv_aclint_swi_create(&s->container,
>                                   cm_base + AIA_CLINT_OFFSET,
>                                   hartid_base, MAX_HARTS, false);
> -        riscv_aclint_mtimer_create(get_system_memory(),
> +        riscv_aclint_mtimer_create(&s->container,
>                                      cm_base + AIA_CLINT_OFFSET +
>                                      RISCV_ACLINT_SWI_SIZE,
>                                      RISCV_ACLINT_DEFAULT_MTIMER_SIZE,


