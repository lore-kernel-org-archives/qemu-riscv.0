Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F5C55ABF
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 12:15:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrx0i-0005zB-Ij; Thu, 06 Aug 2026 08:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrx0K-0005uW-TX
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 08:15:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrx0J-0003KL-9p
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 08:15:20 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6769ne451533992
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 12:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxZ3bbP34fscbmz67dTzcECimzETnSdRjWLq3cv3pG8=; b=UAv/n2tH8LMjYZ6B
 YjSCIMVrizdIY0+2LaOSm2E1TfPHwhD/2V6EashYiCa21/4XFgN0WzBX8I9OtyZs
 T4qM52L/v0tn/nTZwZN3WPHrFqYGyuekfHDbjxasZWcIE1KbpWDMTwOjWZ4E/E2m
 PDDOlLA8cFdQehw8jbA/v4d7paSv/VUt8r1vDVMlRet5tXzDS7i9H00jskFwek1K
 JSXGuaOzS/NCOsnGF47XhiN9Rxtxs/tegv+P2OXdj2FeG6fNE7h5BS5hQeip+6w9
 i3tEqFPZiG1CZYWXVYqc6N64HpyR02Inl5tv11aXk839fXYSGj+5UKIhk4CrNK9R
 nst2yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8psdyu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 12:15:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e4f27f49bso170164485a.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786018516; x=1786623316; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dxZ3bbP34fscbmz67dTzcECimzETnSdRjWLq3cv3pG8=;
 b=ZB0/IuFEyUfY8oNredg5X41zgtTQe1twqU1WoI93HkX3mt2UxTUQNP9DaOS4Ushmpa
 B5CEvJ6EnWm2HtV8HYhaVbqBBgDHMlHoxm7/DEabYehhmB1Mr9CxnbxvcPVa37IhqWkX
 VvsskXnNoLwbl9/x5tkCOkxkdxVzLu0ncKeSp1NKgasO6ZkPkBuNEA2GEmP4zRse0JFa
 FgMZHY+5zMal620BZSLlVwPFqHx/94HSTb2O64J+ZSK3gO5deIUwCBFdSsJlAfuAJOF9
 vhGuCpi2MA792chiwdUv6YEy8jZvlIltuAbCpUL8w94V1wIySei1cLaz+9RZ3HtSJ4vC
 4vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786018516; x=1786623316;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dxZ3bbP34fscbmz67dTzcECimzETnSdRjWLq3cv3pG8=;
 b=qNnjSvHgem9iMzJkIdNvqRXBX6WDkAQU5/X0H4E2+TrvrnK4dUjCctPadRP1enyGkK
 qHnNaUNVRUxRBGADU4GsS+a1YZU1bkr4Znb8iTMbeYwbmxLMOW6u8NA91BEdtT3dQns/
 lBCpGyzrcb3bKlyOLSfZEMQK2eyAKT1lMQCl0SStLRdPjdZA/DGqVIFODXfhuCCSdx2M
 GV89zltelHBRGOlfr2+2+CVVvQP/atZ6JAHAwqZEIvWxjVKFlqg7kUNK+F7H5Xbm8/u9
 ckxN+J650N3PUH+EHLAxpxkfOHZ2J2iUG4ap5rO9i/83fevqdvhtxlwBOWE5kOWcZ3pw
 Ootw==
X-Gm-Message-State: AOJu0YzMhko/uIvcB9A787GDrfxY8fwFt2WSawFyXwZez8hst+UJqlOp
 vQ/o/C4m0IQPnfOVZX7dsklAOXmfgBNCbaIpH9SyHk7xrjfMWASOHPAZcaV+dZggLSHwrqXHaBe
 ZvRV+28ozNjNPVBJyKlyt2ZswY4E7xqvQxjgIS5JmWOlzdEy03H3vFkMpVQ==
X-Gm-Gg: AR+sD13ZNgfpDx3RIDFeZ3JNXnKpwO+K3EeQEoqEAPJpaNjWRD5Ntp7Raw+Zid7l1M1
 M+g9yqEl0P4qM3bLIYVmpmj8xFjbdSCUx5QMXa6pctw3w+wsPVgMWtoQjcJ8GbkiJpTOsV9rVuO
 1M8Mwh5/aEScDXblR6Vk60zKiLb5rvneR05bu3DRU/igZMtguRZNyyaMII1j96MDCdGXSSIh7Ne
 +vIn/iGqnotja22rbsXz696A57macdaG4p57I8lNhLPBsRg+dcA83sPTHpRZgDzOCpuFOQeCvz/
 xlN/LFyCpCCj/NGb3N0lF7ANbhn3/UjKu2/V67nhZ2FxxzatNTD8zorex6Od2zR3zc7fZa+bz08
 dYs/7MxIgRdgJwXJ34MoJyVPKZ5ijCsNdy3o=
X-Received: by 2002:a05:620a:5bc6:b0:931:403:2459 with SMTP id
 af79cd13be357-93649152d07mr1067385985a.16.1786018516447; 
 Thu, 06 Aug 2026 05:15:16 -0700 (PDT)
X-Received: by 2002:a05:620a:5bc6:b0:931:403:2459 with SMTP id
 af79cd13be357-93649152d07mr1067376685a.16.1786018515976; 
 Thu, 06 Aug 2026 05:15:15 -0700 (PDT)
Received: from [192.168.15.43] ([179.93.128.106])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a5b9502sm390347685a.46.2026.08.06.05.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 05:15:14 -0700 (PDT)
Message-ID: <48f01197-ab10-4aa0-9cc5-8db7a92b5c45@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 09:15:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] hw/riscv: k230: add a noc stub region in K230 board
To: Tao Ding <dingtao0430@163.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 farosas@suse.de, lvivier@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 caojunze424@gmail.com
References: <20260727155702.36484-1-dingtao0430@163.com>
 <20260727155702.36484-8-dingtao0430@163.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727155702.36484-8-dingtao0430@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX6Ii/4baXWwQm
 EaJEsSgwcR/d3RjNsZT1qGVKDD+zT1LOKqzYgWGVBXa9GaAnvJhOFAL+z0bE/vfZrxhnvHz80pq
 IDDZk74RAJObkHRvHvsfHUBOxwN0xLk=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a747ad5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=j+AuKCDe0+4C9p6jaetDeQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gE-8AEvGiEu0Bz9LOicA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h74RmQDenBv3aetYrKgN-eWBctngA7jC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX6Ihz/YNVThPH
 BnA+AjTgCIfea7eX3vdGVvsx0YXX3LUYb/SONIQCHJKTtGT1r7ckLwkwuQn/dl3PWaa786nkDsq
 gwAVHmtFxgvvPyJCwtWXDxe+HiJu8Drn04Ago2+Gz0pjvMF95st36sy4ssg/xEsLInyf2yXhdte
 T89WmJTjznYfxSR01vrK8FPycyvYx3MJ6pWVFbl07qH3tMnB1eON2jdFo++Ha2NZlUR4GDm87hN
 EahwCfAyvJWpnH0IFqrIN7uv6K9ylyLmKr7CZubZ03gtKaX5pyVmVreADWCNOJqoUt6gE8/tPIY
 NKDVTJbVoa8GS2YYvPsp/DPNAosUDrGbmwPCYRw2cPI6c9FTK1q4k3lsJ0hwg2pWpNg6lxACU+F
 jK54s3k5cVSlDw4Au7oKqDvFYpsGKImDpctWPP2uHguvFrPBKhfRQaCpJsZf6hVY2AlV7QgHHcE
 P0JCe4HKLEoncVUOvzA==
X-Proofpoint-ORIG-GUID: h74RmQDenBv3aetYrKgN-eWBctngA7jC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060096
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/27/2026 12:57 PM, Tao Ding wrote:
> The NOC address was accessed in the k230_unzip driver, but it is currently not in k230.
> This commit uses create_unimplemented_device to preset the region.
> 
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> Reviewed-by: Junze Cao <caojunze424@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/k230.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 7fd1ec4c25..ff834d6724 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -234,6 +234,9 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>                                 qdev_get_gpio_in(DEVICE(&s->decomp_gzip), i));
>       }
>   
> +    /* Noc stub, the k230 decomp_gzip driver in uboot will access this region */
> +    create_unimplemented_device("noc-stub", 0x91302000, 0x1000);
> +
>       /* unimplemented devices */
>       create_unimplemented_device("kpu.l2-cache",
>                                   memmap[K230_DEV_KPU_L2_CACHE].base,


