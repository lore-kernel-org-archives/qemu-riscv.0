Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20157CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:02:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBxhF-0006Zb-MX; Wed, 30 Sep 2026 13:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxhE-0006Yo-Bb
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:02:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxhC-0004zf-Nd
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:02:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UFX94K194746
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yhJHIqd85X/qmG7jkOELlgDANEDVzR+sdoYHilowfp4=; b=Ob8kHNTaPs7JLVTT
 esxUdhl3avNCAAu3IQyCeztxBj+orEbSmoMJ11t7dIr5C0NjJGUsNMPKMs7ilIx/
 vVBppmiy/P6pY48W561cqaisAIHRaTgvmLEa4Lp8r7ef1zER+y5Xaac4z4m+iM+8
 uAsVVTrGhnc/dJh9m9mDHWXrw7yFmQWz7SCt0wvIjgZ22Z8VQw2+5u64kd3BsFMC
 0EG9VFEmAye8C3dPm3PYOnqAlOYzcfUARdHCAR5l8NM9Y8YQCV93IoTYcv2xvyyB
 YAhMFRi9xKzXCFt45J6yCyRQiyZ/C9DjzyzLzFLYVfJln478dQWvw+lDAnDbmYMD
 xwUE9Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vrda0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:02:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7bf3a6cf1c8so282056137.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790787737; x=1791392537; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yhJHIqd85X/qmG7jkOELlgDANEDVzR+sdoYHilowfp4=;
 b=Rb3WD8IJwPLB7sqY+52vq8qshf+D5tix3RiK5UxmbqgM9A3cC47/Nmt3hOyYNl7O5g
 PMSpp2BZnRDWiROW5Oil/twte1j4ibVLLvPEHS0gasgTKrEMBJ5LNwjhGMa76qA2Cen7
 eElncFesY4Q6xFSKgmURlAv8+yK3ZnrFhdue10ncV88gTzp9/qCubeConaFI40zPWFFa
 gLootzmfR4CBquLFe8RibmmqxwWJNzriIyURUH7lHls11uxWYanpupXuUKgLpZV5AHM0
 NI5cMWPcIsKyylg0XRUoOPzV2Je7kQMsjn5Zrj/6BVrGN9wyJMNPnsYvf9oNjEKVEKPy
 vDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790787737; x=1791392537;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yhJHIqd85X/qmG7jkOELlgDANEDVzR+sdoYHilowfp4=;
 b=uhSoy8d7qhuX6dox5R10fb0l2pjdwJILg2MxvrnirkcpFXRYXBpP79ppQjkQWYDTuD
 fIQQJEAtbnb8mrU8OjtXmpYfZocMdo/uR2eQSVJxARN3GgpT/5jaYIbDTO4gdNolDMia
 NHlVLCHrTT78r83j63fmcvz52xOXr5XGsanlg8LS61Cby7z6DomROZVqENvCdpa2VLXZ
 PuLF1eCkfJSAcVThcnqQMcg7kPPHwSyr0sC6pCpGw3gLdHlVCOMmA/Km/RrSqTekl3C0
 dAglhtnY330XBofbfnY4m7hPUbbaSHVRrd7PaLNni3E0TFFfRpEMPpQELzHkaiWUWMW6
 lE+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8j4HH0rcXbqWth+XW6DpP2pZmkuIRy743C1XJTQtkJQTGDUBD6gLVSRYRoJ6fm45JZTSSdOpANelr@nongnu.org
X-Gm-Message-State: AFq9FYI7UvKB54FDe5H825iSNhbV0mlTpOcY1kGr7xFY9Zz/BXkc7bUZ
 m1iZJQAzakSQKkjm0z0hNw6CXBT/vMJHK6XPO82O8V4WvPoxrcKO48MA6NuLENwm17tCjeLsxPI
 JfDwMojmvpXySI7YnTT9O/x/uRZuHkkGPIRABrfCd8FJodg6iD8D04Khktg==
X-Gm-Gg: AYBFou0piDvu7eBThxHS1nx3CRuGcurg/4fwDEYPqzsRRxJs13zILYbMPbKzhkb56Yj
 aUL6djF7JFQlbWT0dAjTvoxmt2q8X0iywSuiOeXK+AeosHAibf8Gx4rC0upCc/pl1ry/D5BjgeK
 YgQDyDmmoqEaO0LvS5JyUVhVHARCwvRsPemFfO9agaQPjRi8MxPvGuw9iJP4Tn4fxeQhsoFHHiA
 HJ1J8qpFcL+mq7MSWYjKZvted+skWjRjqQeUm/uGE06xbxO3ZFznMoF50GThiRqtf9XAHBzqM1r
 951VF+qNSATBHokqsjNA1OmA9AqkiVOgkFLVte/HCca2LNL9Yxo2fhJEFsirr7ZFCzv6snAmtm2
 xI1FWV+Yfp4V1Z6uZruGgqQYQSMc99Cia1g==
X-Received: by 2002:a05:6102:3594:b0:7bb:a70:4708 with SMTP id
 ada2fe7eead31-7be73596295mr534690137.17.1790787736716; 
 Wed, 30 Sep 2026 10:02:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:7bb:a70:4708 with SMTP id
 ada2fe7eead31-7be73596295mr534671137.17.1790787736172; 
 Wed, 30 Sep 2026 10:02:16 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01ebadf30sm3197255e9.13.2026.09.30.10.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 10:02:15 -0700 (PDT)
Message-ID: <0bf78ecd-7e12-45b6-87e1-4a5ed36e95df@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 19:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/char/dw8250: Fix leak when creating child device
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 portias@oss.tenstorrent.com, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
 <20260929031644.1016354-2-portias@oss.tenstorrent.com>
 <238b1bf5-c7a4-4103-9e70-c5bf9efc3691@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <238b1bf5-c7a4-4103-9e70-c5bf9efc3691@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfX7PWMiDxeAPSG
 wcP0XP/L/te+qpxZTmD9tS+yDv4ombtnLkj4VQz75OchuGrWHAXWO7gkN0TFO79+ACx7Z4pKTPL
 tbUjk4IGqLaoB4BdXXCdpsdzQx3UND8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfX2/NGd+Os7r15
 jG9IWPY+AtDz5wqAvvTDoVL+KOQe9LUt+0cU1PW3jpM7fBYo+n1I7pOmqSDzriMiUlIq6rjhxB6
 rsKv5e/UykXzBOcYtvktu4dhdue/NMErIuJk8clncLDBlYLBW8MiczqSek1xuNXlXL6MlJEdWtj
 wY2clL4nA5rWUTgJWqxfb3tw9BefPG4+lg+J1j95ZpQ4D096NDYCadOk2IXkaODgCAiJL9u0QS1
 QWtlLifYhe9HPlKECeMwK3Ss0Bs/qXTTjwb9/eWTUFGUxG2dknQ+52L5EBg9PsKnyRgMhGFTrmx
 VYba99i/9DgoLGVVCCA9yG3+HtgQOBpu1qa0YYfL6xq0SlqaDI9Cj9ZKwEgwS5fssTMVr4iIV52
 bMKGEpQcWgrhN/FZBPvRm6csuSH67iJCRboXZuaLjDolFy7mXPGXHKsZXWitre1gbpBIb7CQTKt
 QuA7iFuZLGfxI7RLM1A==
X-Proofpoint-ORIG-GUID: 68_9hD18KAi4_veZ0OdqDsE8HUy3k30T
X-Proofpoint-GUID: 68_9hD18KAi4_veZ0OdqDsE8HUy3k30T
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abd4099 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=2V5rpjPJ7MWuj2PC8TgA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300067
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 30/9/26 15:28, Daniel Henrique Barboza wrote:
> Hi Portia,
> 
> I believe this fix should be made by the original patch that introduces 
> the device,
> which isn't upstreamed yet:
> 
> [PATCH v5 1/7] hw/char: Add dw8250 UART
> https://lore.kernel.org/qemu-devel/20260927201326.650943-2- 
> visitorckw@gmail.com/

Oh I missed that, good point.


