Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB36CA9EBB
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 21:52:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFIVX-0005tM-E3; Fri, 09 Oct 2026 17:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xFIVR-0005rv-R0
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 17:51:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xFIVQ-0005zw-0x
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 17:51:57 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 699KhcAA2545410
 for <qemu-riscv@nongnu.org>; Fri, 9 Oct 2026 21:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GDv03abaUgsaRgeFJ+f9XtNAC6Hxo5B3l2j3tulLiwg=; b=KPAo0Sd4cMODECop
 L9XsMf3CqNcMKZos1DFv9tf3ArAUvpXMBZv550g9CLnWxtx+Igdbp+GhfcM0Tezd
 z7vPWe4aPtOFiIZ9GtaBEfPRpTBhrwaoICIbJ2Wx7xCd2bKqCwplxnOVYbus/Q4Q
 rPpavaLQMlpCBPV6IUxbHrCDlvl/E40PUtsuUkzXvZFlx8OGQ1uSSJhIhrunpU1U
 /gi6HszfHXzIdv9WZvRUcD4E8GzoepkplKdRGslhr+Q2NONh2HSQbwfBgbFeWEFy
 Np0gf/SdxyVLf/gqmpc4UXtQjhk+SVT6zkHJHxqYTNheDv0/1M2t6saAzHkUKH7B
 trLRJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7ru31-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 21:51:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cbacbb996so20222885a.2
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791582713; x=1792187513; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GDv03abaUgsaRgeFJ+f9XtNAC6Hxo5B3l2j3tulLiwg=;
 b=eIU7qaoa9+P/64zzT90z2GVADwKVjw+89J4ozjEq78U7BhauaLAA4a01O57otJZ7i0
 u4z6/uZ7QyXsLdbrAxRM6jkvTyM8q4cxfKfDg9l46xQ1+QPwIo5XuckCeiqG6A2+16da
 3CI7gA5rgq25A4EBNLqMU2bkzMJEx1r3qtuWrOGaflBoivGW4LzST9rUYgAVXzAL7aTA
 LIOttn26/RxaB74LvAGGXG752pEoIGsJ6KYnLhzNhSCK+9bDg2VdrYgLmuNo3JgV0Cpv
 zM7wmipIM8TTQfkyIdpS3ILQjyakW8dvs3gzFZ22xqWrwXd502Kd58Mu0XVlHyAMHlnF
 +GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791582713; x=1792187513;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GDv03abaUgsaRgeFJ+f9XtNAC6Hxo5B3l2j3tulLiwg=;
 b=GUupx7w2Ey9HYAxiO2ep/JiNGlH5bQnmYfGbhDrnpxoZan6BykzGv68NHy86yOSDsY
 VQJ3BWzRqAwBBXIPF9ooVF3V4nciZygGW/3gI9Hs7r9mleAHSQrSJrvOOb/1reMiSp2d
 G6ixM+MrX2wNfS5zba1hCixloCclfv2sKTN/WDGygD2CBdFZfWQavvnOIbFEl18S2SQW
 rpcgugnQCE+6xMK610XzPmjU1As/OsO2jM+B0YKF/KCfZTVQecQCVe/3G5EvvC4IUOa6
 wF5FVidKNoBlMzlqVceFLnNLc1Ci9Lw5D5EFU/wbPi9207E37rapg2spXiOHMchLjwyI
 oIBw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzoRrF0NqxjIb01RgQMiF2ZpdDbyGFW3OPtIHmy1ZD5Qnz4krxsZhUjxNmyEoF13x5dtvKnvRl2BEm9@nongnu.org
X-Gm-Message-State: AFq9FYL1f3ZJi21s1AU/W2aqjRCBaWcqY/wYvQn6tyt+m5TkuzchiO41
 9gG7c1Rnj4gwlb7FJ899rQmrAvTESSrzXRounwdmR5EBT2Qzg4y2pV2/FoTtLQNHCqTJ+cnlNTP
 mAMS6YvT9RZpa/2kaFN88qsq+HyMsFqGWrNI3m7WYIjervaZb4DiCm5hRFM+ogLzGrBgy
X-Gm-Gg: AYBFou1g+YRdxam4X9RoYbJ9hJd75KfH6yUPz6OluIFmkeb8UKtwiH+kwY8hQop46yB
 iSksc9Spxz1LGgizgQSZhF6GXV1AJbk0K84n3/x5s15E9nFwgYAOQcqHN0Taac3tiBZvxfZEs7i
 DqMENgnQZ5TJZzwhFsZI9IAO/3P3OE/KOEz7vSsDsJX4zNyhzH083oy6h8O3YmThNWS+TEO2XgL
 ZfQRvd4akmKZ7qYbVSt7YFba4M5ws3RCG5124Kj80JU1Aoy3rifRnfVbZqdNVlvKg5DKJjei0WF
 CR8s8k/+vZnAniOqvfbvgQ65YtwcFoXxwFeSMiTr2T3WzQy0OPq4Dp2JofFOirLkkWn1CGrB1II
 wMOuOp21wdtup+/SPy5d7lnvPJI47CnSzWA==
X-Received: by 2002:a05:620a:17ac:b0:93e:5cf8:e5a4 with SMTP id
 af79cd13be357-93ebd27554amr471201385a.58.1791582713500; 
 Fri, 09 Oct 2026 14:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93e:5cf8:e5a4 with SMTP id
 af79cd13be357-93ebd27554amr471199385a.58.1791582713037; 
 Fri, 09 Oct 2026 14:51:53 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18beacd2csm92053425e9.14.2026.10.09.14.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 14:51:52 -0700 (PDT)
Message-ID: <4e9a1c83-033a-4e64-8b44-a9fc17b3b921@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 23:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Fix vector constant matching for logical ops
To: Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20261008181647.3015949-1-aurelien@aurel32.net>
 <118805f8-bc4c-4600-b156-5b494a840ef5@linaro.org>
 <asksJ0sjVi9BZ5m0@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <asksJ0sjVi9BZ5m0@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4NyBTYWx0ZWRfX/VBxS9qSyDwj
 6j9E6NLAhj7MaqE2rDSneeujgxc+hNdrE/niNyqg+F0wkdjNbHxumUgBsjUtf4MMGjhm0Bk1Jjo
 YMvfGp4V7XpcL9KrPsbLto5a/OWljkTcrc6HlKeXoee+STL/SUCQXr1/4vMR0ebfrJr5B9muMPs
 JTdiU8iN8kh5PGUXIbrc+nQ4Nd72e0kO4SuQWXE4a7Ux/VMPevIEkx2qf2T+ZodeM1D2jI3Ii5m
 JCM0urXt7beBMet8h6EoxKTQwi9OgVM88SjihBTUOX44eXFB1TtJRzACx3Vk4n8tOZ06zTmbO7m
 9MSL6ObVPuvOX8bYWoAEfBCDNEfBTa8YcMO4zu7IcWJ4qBtcxKs0ISGI5LrKa3WuJ4MWhDK2WCQ
 iNY45JPITKmG78w+YSqE++KV1xgTo9b++Ly6V3gnUNlsdb98ZewfXqtU5nVIXm/oZIhH96iKtcu
 uglVFZJEOT+IMBLk1SA==
X-Proofpoint-ORIG-GUID: mHJhW2BPk6LR_u63OMor4AfXVSBCd9nF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4NyBTYWx0ZWRfXxgbKa3r36Zqm
 KO4NV+FqRpBvzFd0H8L6+3nra1CscfC7xCbMXF8r4VD4lXSucy/W+hZbjT7AFrAnWzzJ0MmBJ5b
 P0S1kYAB1dcU8rHYPzYVOlFOyQ1OmGM=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac961fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IY-dOOI46LtgxrX4_OEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mHJhW2BPk6LR_u63OMor4AfXVSBCd9nF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090087
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

On 9/10/26 20:02, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-10-09 07:05, Richard Henderson wrote:
>> On 10/8/26 20:16, Aurelien Jarno wrote:
>>> +        if ((vece != MO_8) || (val == (uint8_t)val * 0x0101010101010101ull)) {
>>
>> Do you really want
>>
>>      val = dup_const(vece, val)


> Or maybe you just mean to replace the check by
> 
> +        if ((vece != MO_8) || (val == dup_const(vece, val))) {
Likely ;)

