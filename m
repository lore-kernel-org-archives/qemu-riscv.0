Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B1606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WH9yBU1Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoL5E1Rp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxY1-00065O-Om; Wed, 28 Oct 2026 02:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLxXw-00064p-5h
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:54:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLxXu-00074x-7G
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:54:03 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S4PUAw3936101
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dUd32yJksJOL+17pXKnKYIz5A6sgupNR/rfnyBa806c=; b=WH9yBU1QCLRtpE8Z
 pna1Zgz80/h2WVDOsZFlzM52G/6vczArPIHVrFx2sszzYtMqcchNmWbDNHOOADJi
 a0alGkZk9VC+SxdRJnodHCAhNiBgQnxljqO0B/7OhNmfOd3IUBAb3THgW6YT3Mre
 54La6M7R8cjup4sCRvqJPgifdDal99buXCwtI8IQK1TRucscLiVivhtzYDXiOn2u
 0teTsLElIlf1PXQC8VNbniJveKenjShvPCGtwjnJesEQYRF89H7qRXlzAjOMTHJ2
 ALJdjyv1Wqa733EDf+QeYTjYA3IolIDYsfi/ctlWZXfxJWeI9yVpJbjbPr69LsXh
 r8OjCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be16wn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:53:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so117945585a.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793170428; x=1793775228; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dUd32yJksJOL+17pXKnKYIz5A6sgupNR/rfnyBa806c=;
 b=MoL5E1Rpi1kgXCBmBMk9EdoVI08mNJM8LgGRuloiOWBQK7vTiuSdBztIZ6iNKRz6Qt
 murnvzxYJ5QGaoJL9rf3ZfqBLv7snQI+W/lp0fdnDH2abULwxz1YR1jADfGo/Y4qZw9O
 z9/qkkZWR1h+vOsFQ5gV1JrVHpkZo73H8Xuuh8jgM5dJCCFrSLnWTWM1pL+ZJ7P9tamu
 5UsVL2zXWAEVpn1Dic8OzdJwqEfLnVcwaQ/MgiZ9GHp1BjFT1oJyQNhFST2o93zKeaqD
 z1ZtMx9yYRLeZcWeNwqqy+XeRnuziWtghGOZ0glq+sVyiOlPbWlpL7Fs2wEBMg93vTTb
 4Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793170428; x=1793775228;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dUd32yJksJOL+17pXKnKYIz5A6sgupNR/rfnyBa806c=;
 b=B5eUuf3jLvSUaxX3vSU3+OZvLmQKS1raAIvCpmS2xPciujUIZuN2S13A1Y/7nM5BhI
 DdT/pVKIqGzUg7wwC5IIW0pGj2Ny93rQaaLYt+1ZLBgqbXTSqwMekVIBxWl0hk+DhkjQ
 Fxdw/x8HbczgMJ128G9WoPyX+AD5D05zmtiRXmcM6637jXRMrBIExI5Gn2+JcYG2f/Kx
 xMRBEYwTEFoLWksOfoKwpTCiBdTidKH6obui3SMq+xmVljUNREkisqp9xYZxhUJzygSv
 ANwNpHsh5E9Mi2gxc/VsaILSQzlbWH8Fa0t9CLMKADcYFpnsGD5cIsT3j2/wElbNpIXh
 lDhw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8qmT+68b/+uBd0IOXT/2+rlmqAwrwqf2pJA49WQIy1zH7VG1zisWxoj4wXIH3EBlGsPcnyUeecYEa@nongnu.org
X-Gm-Message-State: AFq9FYKQxZPkGeTje3Vclgb+I3Y3MxqWcQWbIFK8heciHvuiBXiaGKtr
 irvdMZKs2a1xKErp4CcpSM984mjTs6sdeKmFXP7EH7UmbNfWzsLNI4xH9075apJOnZEI6TpOf6z
 qTVDpdudz8XIJ4pY+Ds/Og8ihJ3oIVUufo8Nhu4rSZUfwOKlGFzZsuIXKNw==
X-Gm-Gg: AYBFou2X2eXLEbex1lVuatdPdkjRhuDaWimNfatzlAnAgaPmJgttZ8n6KXrFeAjz4i6
 aPxAkIDKYSaaRVvnbtX6Wa06oiowXPqCRCTm/OH/ng667H3auesdxVqA4eURqdMgje7V/P6Gqvr
 XYMTzwJNTri/tiR7fVTo07VPaDVZyNwT0w3N0q1stUdyqNOX33NUjxevWe41RR42BLEXejU5aja
 TYmifM2NO8L3iraa8firAccwAjr0lF9zSRUhTGGs4j25be2hHr6mfxQFYVS3qQiYVEJjUNj1NWW
 FDV+QclemKIR3E/J7AwP7MHhDOHvWgnV+v3fhOycqC9LRJe5q7DSzAMesTW5+D25YT6BeDe7Zez
 lqnkDVQaOp5HrYX6jc5+0XYgZ9xW9hrAVUUgq2zDQ01vI1XG0bzOBfxF0VwTXtvO8qiIdGwoAe5
 Zyvhtk3kPm8FB1eSdKTyjtOO4=
X-Received: by 2002:a05:620a:1789:b0:93e:9292:1b9e with SMTP id
 af79cd13be357-9440891bc3fmr179242085a.1.1793170428440; 
 Tue, 27 Oct 2026 23:53:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:93e:9292:1b9e with SMTP id
 af79cd13be357-9440891bc3fmr179238385a.1.1793170427844; 
 Tue, 27 Oct 2026 23:53:47 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e4115f496sm25577021f8f.5.2026.10.27.23.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 23:53:47 -0700 (PDT)
Message-ID: <9d09b025-1bb7-4f6a-9821-400141437126@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 07:53:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] hw/riscv/atlantis: Back RCPU memory region by
 unimplemented device
Content-Language: en-US
To: Portia Stephens <portias@oss.tenstorrent.com>, qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20261028043059.600498-1-portias@oss.tenstorrent.com>
 <20261028043059.600498-8-portias@oss.tenstorrent.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261028043059.600498-8-portias@oss.tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F9IDcbzeH6pjOTbMfKlX7bUXM48FrWvX
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae19bfd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=t9496tuAAAAA:8 a=X0qeV9UViFyIYScYyhYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX6r1L0xULCK2y
 2u8/fo8B9Mjbd4ul2+97DH4AttL719Nuslqvcx5RXAzMnap5ReNYyE5WbVBJGhediN6EQ0FWSl1
 yUifswMkuejhYAonLZqzc3s0N7Z4tsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXyYbg8eHDFnyC
 8rQH4w5D6FavTDVHGhZe9OTDfKFttNoYjN0KTDQ1wfdSklq+FVLyvpHgXnvYZi8UQSnhfV7B1fT
 GavzXgWLspcwKHAgLO2rNx1/PdtuoH6JPR8cRPDunmKMyptIVawAY485EvdJWo0C78JvhwVXfJE
 LxlzkgVVtqJEdMIofdpn4jlRuaGV5mBvSYN/PFhxJCnMsDtm9F2p6n2u+72drQY7cI0Vwum/0Pq
 jUe1a6gVOpUxx5c5DsogUCaaBeuV3Gey5A2VlavFIALL6Z629f7br5ocTUNVS8ssTXyAcsKpnOj
 HhqQw6Cvs3xYtPh7dNWdZpPcG8OSO0STdOBPib9s2suXqreYy8yo2ZdMblvZexXVYESc4hKaiaM
 M2kHnmNs+L+YjlePiUkdu3WIMKTtVM+aHTfie7M9D/xn+2n8Ed5cXw8MTX0hMc5PQSqE8+TVIW1
 87ga41WlJqRBQdW6oyQ==
X-Proofpoint-GUID: F9IDcbzeH6pjOTbMfKlX7bUXM48FrWvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28/10/26 05:30, Portia Stephens wrote:
> Most devices on the RCPU memmap are not modeled yet in QEMU. Back the
> entire 4G memory view of the RCPU by a low priority unimplemented
> device. This prevents accesses to non-modeled device from faulting.
> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> ---
>   hw/riscv/Kconfig               |  1 +
>   hw/riscv/tt_atlantis.c         | 20 ++++++++++++++++++++
>   include/hw/riscv/tt_atlantis.h |  6 ++++++
>   3 files changed, 27 insertions(+)

> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index edf2180a98..66cbb2b8cf 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -519,6 +519,17 @@ static void load_fdt(TTAtlantisState *ams)
>       create_fdt_memory(ms->fdt, ac->memmap, ms->ram_size);
>   }
>   
> +static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
> +                                   const char *name, hwaddr addr, uint64_t size)
> +{
> +    qdev_prop_set_string(DEVICE(dev), "name", name);
> +    qdev_prop_set_uint64(DEVICE(dev), "size", size);
> +    sysbus_realize(dev, &error_abort);
> +
> +    memory_region_add_subregion_overlap(memory, addr,
> +                                        sysbus_mmio_get_region(dev, 0), -1000);
> +}
Please use create_unimplemented_devices() (see commit 782dbd23fd10).

