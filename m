Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B90C88E75
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 03:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7PFH-0007zc-Sk; Thu, 17 Sep 2026 23:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x7PFF-0007yy-O6
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 23:26:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x7PFE-0006le-3p
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 23:26:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68I2UJfi457250
 for <qemu-riscv@nongnu.org>; Fri, 18 Sep 2026 03:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NJLPYacTxXFB17HuXQnVy4Hrs2GiTJh7L+fMJxukKJg=; b=XzZ05LfUgtEGmila
 Hp023JF/qhkVq3MT5kF5wjfFyYjXRtCsh0/WV4tO1Ner2ddRQlEXmbANX9OpJdOc
 ab5VocN/E4OC3+iQMT4QpN2h7UnaCNjMBq1DFA2VQLAwwI7Ef06ftrLeLWK5qqhB
 9GAPXF4nvZuPfTLbbhiiVX9G2733aoDP+HTPCFUYA/oR2+y4v6qHSVvoaP2EXKLt
 ui4Iq+yA7PTbtTtnsEz12qLOxwskEPwPN5GQEA/5DVDJlAMp6qAsGJ3ghje25Krf
 kVsxjHMUVXxG8bpoapGxT/S9Vf1MT7LiiENgkJKeXsuZkOZmGdLd1Omq23F6Wo6g
 LmdDaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdprmk5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 18 Sep 2026 03:26:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5329e965ba3so3349681cf.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 20:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789701988; x=1790306788; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NJLPYacTxXFB17HuXQnVy4Hrs2GiTJh7L+fMJxukKJg=;
 b=Y8uk88Zvqm1jo8VxrX6sfMw/omwciED34yhkO/69dUJBw8BTU2svxdccdmlHVrrwdc
 6m+jju9Vi8zPzgMcyPU0eK9uh1RHR9uGfjDGfOQNk6utOReVsR+C5TYih1+K67FR0R+s
 p296mB/3BbJ6DQdWFnu5A47K5ABMmWWP7ek0JSZEr4nX2J+BhQjPKzGB1+0S+ImGHnot
 r6a0ewtERCZz4Om+mmG6Ya3FZ0DElD6Z99CjYkTCL3qLsAElXo7Go1NSawsRkYkl+WDH
 h4oO4ZQBAVdhwnNJ/fSnfmBstkoaD5cM2zzB2J+tZ37kn5w/tt42k2DFib2EzHSt51RT
 zmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789701988; x=1790306788;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NJLPYacTxXFB17HuXQnVy4Hrs2GiTJh7L+fMJxukKJg=;
 b=tJ/mUdP51v6/lrPV8LSd+EHkkbe3BRe9xIo/EW2uKBYwrCBQTO7OJGAe5k3CU4nlej
 i0GTiuemGuOG7OTXLLLN/oI++fGG3DIlUzxjW7QxApVQpof7PFb/2D2gaWt8o8gctUqF
 3WQ4ThdLg5OgiJ5XJqmoq0HNAMBEP1r/deMXW85+oRXWHBksVumVyng34DsdLFpAbBnj
 Sj69cX2pzGlJuSa3F7hxPF8ghcIsMFYvqBfw6LPFUupljdqnBn39qicYejux2bk8P90B
 DA4G0vhsOXTDe5oaOGogKJIJuFRqHJwxqCW3wxY8x27QN+L+vVP0HZbNvPa00ZkhYc0s
 qdfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5yRPShe/o6GsnUQ6DSqkSHsK55eTmwhU1Gh5mtd0A8czcclOh8wxlTpgr8/DgY/SYrmKYnHqJh0Xa@nongnu.org
X-Gm-Message-State: AFuF++lTfX7szGytcpKZbQwOP7KeTrR/CFl4aFeg5qAGeSqRJjWFVpfT
 1RZ0UWPOYF9x+os8AclGpSKw0YhoKRchRgXc+Fi/wZ9xeKHGOgURiZZYgnYMrnh6H8YcZneKt2G
 i45zB09pSQK/3QcU1rZ2cuvl40i52s7qodnLfhgQmBoHufFqdTQmol2fmtg==
X-Gm-Gg: AYBFou2CigH3pB5V5DvXBGqu8W5+blOPPVPDTCkdGpLdJS2pOGa56HuhNC74F3DEOz+
 yuDqfDCkh35Sv6huM4LJiacYXJvL8Re03O68MuF5RBP6TzLANGh2V8y6RPgUgWD3GD/5Ew7qUYY
 uXZx6R84UZegOH2IVtUjPgLqLo8Wc0vlhE7roU15I2+bfBNSsMrWG1lWWk4hZtPJCD9XIXxFVCs
 UjfB2xCSasmJnjmVMTX/cCc/K1WfcJLNjwGhjaekk0+qWHoErdRptTq71C4uvDnn5ILveI4Qn5P
 RAXa0Qy2aoFh9sl+GfnibESVA7g77wa70jLMNRi+zNExcOzl2wpXnyjMc4IheK064YIw8eDn/Xk
 8JBOj7mrK4dbP3eX1GBGenBI2C91cbvGl/NXvMtdinijqq8pOc2H2Qq23cmEJY2phLpR8ksi4FB
 wlq8U=
X-Received: by 2002:a05:620a:4809:b0:93b:d7c0:461c with SMTP id
 af79cd13be357-93bdca91c94mr156051685a.87.1789701988340; 
 Thu, 17 Sep 2026 20:26:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4809:b0:93b:d7c0:461c with SMTP id
 af79cd13be357-93bdca91c94mr156047685a.87.1789701987908; 
 Thu, 17 Sep 2026 20:26:27 -0700 (PDT)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93be0e90276sm31322585a.21.2026.09.17.20.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 20:26:27 -0700 (PDT)
Message-ID: <8c35fd98-e9cb-46bc-a014-bdef47c0e524@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 22:26:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] hw/hexagon/virt: use unique QOM name
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
 <20260918000640.1001-6-luoyonggang@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260918000640.1001-6-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA0MiBTYWx0ZWRfX3jAOb8hPtSDc
 ORR3s7GmywCwpLU6UFN8X455eMXXmg3fWPUP63DCK1X7jg3oKcN3+nk5z6VmqBkT3JsK/xLnOX1
 u+joIfThFaZ0YX/IxiSJZDDN+kIXb27/HOTcxhVYatqsrimNn+3hDqUJfMAiOAuaNGQaT9+EhJd
 plPLqRzbaLWUmhGxdPxtFPGmwaW2Fc3x377fsVTFy1hFcNCd7TAx5N1cQeskEl+OvbsUNsLM4uK
 ud1l3pFSqZVBRXPZdLK0u8E2phB8ET7Ymwscm91Nqcc6uuL2oT3Ju/nDF15iPu/c9hluwE4i8hp
 VIhpf0uWdmaV5IXnQVRqASDnafhaLNHyZK2vQDG1nS/LLNzS2sM2wlPZZC9X3pq+GEKao3rTh3d
 H11CcLjGgJLTKvuOS8pym/rcrDdr2Xkr84zxbguZCi92aLdOcVeL4X7NKrq5kPTuXx/EN/JfGCU
 tPiKbc+J0kYq0HaFaaw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aacaf65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ne3SjsFjHeSDkW3U5kIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA0MiBTYWx0ZWRfX5Ljm9C7hV2Ha
 jlvu28nnV9okGY58ltVSgvuTM+oVeJ8l3jyS/eHJQzedRw832JPAqOlrelIVlWLNF9UD6YjpMj4
 CpV4nhXhn8DSdCdjK1mNLvHgfqx7Krg=
X-Proofpoint-ORIG-GUID: Ih78zByNUgM7ysjISGP8hcv69sY0p0gg
X-Proofpoint-GUID: Ih78zByNUgM7ysjISGP8hcv69sY0p0gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180042
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


On 9/17/2026 7:06 PM, Yonggang Luo wrote:
> Set TYPE_HEXAGON_VIRT_MACHINE to MACHINE_TYPE_NAME("hexagon-virt") so
> Hexagon virt no longer collides with other virt-machine types in one
> process. Keep the -M / help / migration name as virt via
> machine_class_set_name().
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   hw/hexagon/virt.c         | 1 +
>   include/hw/hexagon/virt.h | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
> index 64d8366d27d..04591066bef 100644
> --- a/hw/hexagon/virt.c
> +++ b/hw/hexagon/virt.c
> @@ -359,6 +359,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
>       MachineClass *mc = MACHINE_CLASS(oc);
>   
>       mc->desc = "Hexagon Virtual Machine";
> +    machine_class_set_name(mc, "virt");
>       mc->init = virt_init;
>       mc->default_cpu_type = HEXAGON_CPU_TYPE_NAME("v68");
>       mc->default_ram_size = 4 * GiB;
> diff --git a/include/hw/hexagon/virt.h b/include/hw/hexagon/virt.h
> index 4ca2f1ef859..523c4858036 100644
> --- a/include/hw/hexagon/virt.h
> +++ b/include/hw/hexagon/virt.h
> @@ -26,7 +26,7 @@ struct HexagonVirtMachineState {
>   
>   void hexagon_load_fdt(const struct HexagonVirtMachineState *vms);
>   
> -#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
> +#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("hexagon-virt")
>   OBJECT_DECLARE_SIMPLE_TYPE(HexagonVirtMachineState, HEXAGON_VIRT_MACHINE)
>   
>   #endif /* HW_HEXAGONVIRT_H */

