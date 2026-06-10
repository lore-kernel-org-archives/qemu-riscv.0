Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97198CD8CB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXIAi-00052q-70; Wed, 10 Jun 2026 08:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHS4-0002F0-S7
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 07:50:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHS1-0003Ej-Ub
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 07:50:32 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNKRq1063917
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 11:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ofKX77HFJiSTCtCdtIsMu/Cm2CTBxsJrU93iTnPYt7k=; b=LrzmNr+sZibs+cmt
 ZlgLmxGrIudtnubHdgy3lTooON9owgbuEflUhBTykKwnkm6SZFVIiIAvkRBaeQx5
 Lq6H5/BFjzLcn7giJNPMqKSatZQ6nU2tUvQ3rx31cv1DGS1GfmIs+16ordXBvUe6
 9Z0MOr0Mk56/0SnwIzbWjSi+UC70Cqqg4jMc7IUwCPozybRNmgvbpfN/RwT/yE/G
 fI9oKrfYSLATyMiPUNxoYipHYrEsCpSj1IeLfaN61zYgnNyZZbWPttG6QrKkYr3o
 kV+Bp5CX5+iOHSIG7PSUaZCC70SRcU6JzAbLg7jROjewEgWd/0yT6CldNEgMehwN
 MYzDeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rn5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 11:50:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91598ab3a1aso953305985a.3
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781092226; x=1781697026; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ofKX77HFJiSTCtCdtIsMu/Cm2CTBxsJrU93iTnPYt7k=;
 b=SQ28LVUuujki3sG/M1Fl/bSeYYtn4lO5gO4HmHerm9c+qQDCAjbInkoLJfX1UF+5qX
 JzOjfe4te0Yxtq8+XT6CPAIwm5hHq3lh4OUnzxmJzJBOu+/Y6+H/RZ4/NB3Smhs7YrwH
 y6gBfU3VaLSh6eqeBfEEkJVH2KBKuhfcEKdxvrjI4DX1UEJJOi1NS40M62hzejmHvYoF
 rVYrtmXRR/ftmNdiN9zT21uP6esk1XDLwgTfucBwk3feJMr6abw7z/WJXiNnJubmXOYu
 L+QLB94QAveVySYJgEN/+4UKiF+NRkmNgOaDuNje0yqibUpcjkbs4MxiePA5I2WdICR4
 vhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781092226; x=1781697026;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofKX77HFJiSTCtCdtIsMu/Cm2CTBxsJrU93iTnPYt7k=;
 b=pq2RWF+9+bRu1mRn9FgB5L39KwxQ5rSxY2NEa57hG2ib5at5s4imcm5iSP60XWT01h
 vh0MFhSZri7gGMwgsYilY0swcyQKeIez85GkSG39NqUJAKmzzCTn3viAdPD0MWGbswOW
 te5vdv/ctc/P5B56izv4gYlf2yxy6fes9nERtYiLUfSfv7K3/arsyZ5PX1Fo/dDOVQt7
 csGtnr/1iWf8g+SGq2pkMvyMaTzdFnV3DIluajl5TNyR0yDwfnMBoB46Tk5zu8OIfoYQ
 53W/XGAv+UJyFaxVolX0ELbBUeqj223k/wbvjcJk/5xcfgQOfL+QAMAEyiqdFaWUrbjt
 iV1g==
X-Gm-Message-State: AOJu0Yx0mgGQEMgEYyUw6xfPqfKlzWKoznWXvyHKPZYGromqSOdGnptu
 7qFWORPRdEurkQ5NNR0+53a2kqirDbkRwj0JcZOz7ex0nzS4VYHwXKXTexP6yLu0L/nfi4S0WIq
 a4vTNiItWCZqGu8p91nsWo3SiYe5twhRBDQMbZsWHHByP70tOG9RZm1wvcA==
X-Gm-Gg: Acq92OEEBZkX7jqCZ6WGOoGxNkdQKZt6mI1xDycvOHnQgvWfy1vi0DdnSEMakEDUfy7
 C/cMmdLFjpbsnkE6dHUDGSkbGXU82UoQl6pMJjHzTWPjJwfZGWxdcsWKn6fUwvIdMTPvGJxOve2
 KZD33T0VYCIo0/r1p30Bqfb0XPDlrC7XnfR5sfaMg6+XYR00c4m7OIUgCMXTQTIWZqFPNHVm5jO
 RrpMV59FuPwXMOLcHwqmQo1gKcd6xLVujRta0S53uEIA8pl8KM9qL9NMgExr00rB6AHW+pxr9M0
 SuZMs1j4xeHUKy9rGGIEuI+roi6N2OG51HelK05wFIZm1ZLfwS2Rvx2LgxHt7SevWpmivJSiuFV
 H6YULRzSPyQZ8LLj2oYasCM8ytJ7zDYy9RXe9eamHraa140tR1JyP+Q0SRh5n/0hKyieLHlyfZJ
 2vbcs=
X-Received: by 2002:ac8:7c46:0:b0:517:6dbe:4973 with SMTP id
 d75a77b69052e-51795a2c054mr348998351cf.14.1781092226423; 
 Wed, 10 Jun 2026 04:50:26 -0700 (PDT)
X-Received: by 2002:ac8:7c46:0:b0:517:6dbe:4973 with SMTP id
 d75a77b69052e-51795a2c054mr348997841cf.14.1781092225915; 
 Wed, 10 Jun 2026 04:50:25 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0522834dbsm1163008966b.27.2026.06.10.04.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:50:25 -0700 (PDT)
Message-ID: <abaf8382-34dc-48ce-ad6f-a548c45c7cae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add 'trigger-count' debug property
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
 <6db02c91-83fb-4021-91ec-72e6b56afeb3@oss.qualcomm.com>
 <25dc379c-7421-44e2-98a7-15593db4f93c@oss.qualcomm.com>
 <affa4048-c00e-44b9-b06b-06a5e38df47b@oss.qualcomm.com>
 <33a655e5-2f4f-498e-92f7-38f0fdb7f10b@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <33a655e5-2f4f-498e-92f7-38f0fdb7f10b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Gr16t9afIQuzudWDPrku-PF7Izhf22NZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMyBTYWx0ZWRfX9N/lxsDwVL2z
 60C3OwOvLk0yuJo7UAOkmSLA000iMV8ImjcCDooYheFkZFM/Ze9Uabk9MrG9gBzSoiFdwNW9d10
 EFdZWjpIOghHNcmwA1SW3xtZZJbK0Rz4uht/8+AoOR6I4c+gVPNeV68E6Eh4MpElJ75t6nN6YfE
 KGRVrLFCkKLkBX5uJ7Db410V0pgyL9hIL9y1TzAG31uwcikoZ/9Ybr4MogOzs5Tg4Q5EO2wvmg4
 5Q8G/n8PFM800yroaZk39BprBps+szsvLoEw7Q8dzBEbzWa3CE0Ixot3FJ+eqZt2IYmG/MEBV+L
 3B/6TOvyEEGiUzLXgHWy+QWXu6qOvFDEDOcLRJ8bsDFarkz2r9P7dvBsYec8skp0kMDufE7i6i7
 fGq21cXUpvKStvIEjEaDYBPejUe/+Et061mHJvBFMSMueMNLYCrrPujI6uVriuwpWaRts6VZXxQ
 cxFtQ1UGoePMhi/kP2g==
X-Proofpoint-GUID: Gr16t9afIQuzudWDPrku-PF7Izhf22NZ
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a294f83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=RQG9ARxXRu_TNfJd-fIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100113
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:38 -0400
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

On 10/6/26 12:59, Daniel Henrique Barboza wrote:
> On 6/10/2026 7:54 AM, Philippe Mathieu-Daudé wrote:
>> On 10/6/26 11:37, Daniel Henrique Barboza wrote:
>>> On 6/10/2026 6:04 AM, Philippe Mathieu-Daudé wrote:

>>>> Orthogonal, we'd need to replace these target_ulong at some point
>>>> (likely bumping the version number again).
>>>
>>> I suppose we should do that in a separated patch that handles all ulongs
>>> from all vmstate objects of this file.  Then we can do a mass bump on
>>> everything.
>>
>> Sure :)
> 
> Btw, on Alistair's branch, this change was already made.  This code is now:
> 
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINT16(env.mcontext, RISCVCPU),
>          VMSTATE_UINT8(env.trigger_cur, RISCVCPU),
>          VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
>          VMSTATE_UINT64_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
>          VMSTATE_UINT64_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
>          VMSTATE_END_OF_LIST()
> 
> 
> This was done by a patch from Anton Johansson in that branch:
> 
> "target/riscv: Fix size of trigger data
> 
> mcontext is at most 14 bits in size with the H extension, fix to 16
> bits. trigger_cur indexes into tdata*[RV_MAX_TRIGGERS] which holds 2
> elements, fix to 8 bits.
> 
> This patch also adds a migration entry for mcontext which is used in
> tandem with other debug data that is already migrated.
> Note, the cpu/debug VMSTATE version is bumped, breaking migration from
> older versions."

Ah great! Too many series to track, I forgot about this recent change.


