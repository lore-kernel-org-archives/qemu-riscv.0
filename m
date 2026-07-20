Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD40C4451B
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 08:26:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wljK5-0006d6-GL; Mon, 20 Jul 2026 04:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljJd-0006Zh-QE
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 04:25:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljJZ-0001di-RT
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 04:25:33 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RVfo1520116
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UQTmmlk3Ftp56dW3WFZ8bcsagWfeiqwA7V2wJpSIxpU=; b=RZ7afEKWl5wCeByS
 G16daZdK1FAAMw2q64I/IcE4dU5G4voWbrqNf1NTVAI2UGPcrfwYHgqv26yVTvcG
 GcJ3Rl90J2IpFbqRKPhzaUtqvhFhF4/gpHHhTEyGDrVyzT7z9DIAKOOLL5Q5CUtp
 Uoc1E71OzHGFiQV6OH5r/CyQDpwYt2yt6wjgdSt1KF/I2DG7MtYcRg0nwtaGiG6d
 8WMTmfXceCSdXP4W3u9VkyLWK56CukFGbIL4MJ1mSeRlOwhIckOd6zJC22H8Ur32
 aXFS53p7NL21QAqvKHRAEhUte9UVyyCnUz4ihZYeAKeJykO8A/uxlD35srWaxdgc
 13KQHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn5q8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 08:25:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so144713801cf.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784535925; x=1785140725; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UQTmmlk3Ftp56dW3WFZ8bcsagWfeiqwA7V2wJpSIxpU=;
 b=Kd3AqQpT7+RZaiqSUhc1wZT66gdLZhOPngyUnNFOfHSLBIxEuRjiLrwPmapaj2H54P
 FSP9kl0A4G79dmOF34UxE3OC2P0+6C9RBgBi8RTAJTVad91tRm3UwFCTkHMnhjPlGrrW
 rzxD7dPTN4+O6MDsxTGkG1s71l1elVj+MH33Ad6LkzS/bfQ/xynt65NF3LiXjXuIvyGA
 jfOhvuZmMdLUIKFBcapXwKyg4JPTRf4GMgY1GEpGgFr7zcMwbfLLPGn27b4iB6PRQu8i
 d5TMGet8lf79IIDLiR90EcE/p4iHHtkM2b8ijQMsvZx27fNCB9fzsShiewJtOxJSsi5x
 ywUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784535925; x=1785140725;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UQTmmlk3Ftp56dW3WFZ8bcsagWfeiqwA7V2wJpSIxpU=;
 b=aPoxw9wk5H0vc8TmAQhgth6gJYazFsSKqY6Vyh/1SrIg3LT+Af6T1+m6LXyymGG2EP
 k0gsgEDG70NbsA/ggpeHwsNyZPUCx2L5OUiBo07RXP6EbB5lTdKWv48T7pfAFGfcGvJ5
 nt7jTqhLidU2YPo05YlzIuxHzBCZDKKHDTQxB70Eo/MzG/nIxVtprp17tWR+JvaSa+LH
 O69OOM2HpydufgzvpUsCdMRIVZBXDi0ZFcs+/dWzpTawVaQXoss5q+Ze2piZe5+FL4IR
 dDv3SQbjTK3QEro7xiCuJWFv6jwckw+FEaHLstNILCUV557Dn7W5952DimtQpYp735RS
 ShLg==
X-Forwarded-Encrypted: i=1;
 AHgh+RplI4D4oMtxcBM2WwKbKeZS29xNEuuheAmKNW+vgh9RLDdq9wLglsokAQrXBUEZR2mPOTLjdBQbAgdz@nongnu.org
X-Gm-Message-State: AOJu0Yw6NueObyPAHTPWWECOfDfKVocZ/mntOiL31ew8M6koQ8UNkAok
 rGbPF6ZBJrwgadUc+D78Yp6VQXdGLFmQqTWN4KyymF1NcLv2THcJa1/v82AxMW9YYzVnJk4ptyC
 xHivBYF6PBHGxu7B74mKdyETttWSBNfvCUaxNqiEajL8OQd5fu6Mta99WWA==
X-Gm-Gg: AfdE7cmxxzM0uXnAxjvMQaZBhZjFRSEHzAEL9RHjT0wEYFmhVcqO4fjwIxRtpP8df29
 sOLME3nyMPp3OEuDkGiWQHOv/SKriC27rPQWe8zMEPcJj+vRXZ2Z3krHprp8TiGCEDbosQK/bFS
 v+ZeHhMpYYwQul2EuacfACfjPRMwGEE5NGCM9IOFykMbSNf1NZxpiqQBOoR5Wvi9ObDqgielKF8
 n4cbu3Hp4lKNPmwxVVx/k885FZaVsR6voS+3eX+YpOmdhVPKg9mOMquDj6z0uR/KdMPOpbP2lb4
 UeMPkTowk9b/A6NUoqKx6kkNoWGStH/qJ2MrLzS5yJMHt8bPYQO16y0BYBLUBUxE6QAJrXqlmLM
 33SfYZFsz7EitJmfkd9QBDBnvyRpKXgZJu0rnbEuW9XobegkLS7U=
X-Received: by 2002:ac8:5ac1:0:b0:51b:fc54:c23c with SMTP id
 d75a77b69052e-5213e67a3c3mr119006661cf.61.1784535925481; 
 Mon, 20 Jul 2026 01:25:25 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:51b:fc54:c23c with SMTP id
 d75a77b69052e-5213e67a3c3mr119006431cf.61.1784535925104; 
 Mon, 20 Jul 2026 01:25:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e52aa4sm28555684f8f.10.2026.07.20.01.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:25:24 -0700 (PDT)
Message-ID: <45c9ab4c-3f47-44a0-8f48-bad329c9c1cd@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv/virt: Add optional UART1
Content-Language: en-US
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 pierrick.bouvier@oss.qualcomm.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <tencent_4EEBFC805F3E59863BEDC38094EF5A109206@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <tencent_4EEBFC805F3E59863BEDC38094EF5A109206@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX7y1I+J6vHDXW
 +5hx4FW7QwKBSO8SY8EWDEc8+ZTllIV57BwTFgp0u3VKVURA6CPD9J38SW6s69yvW4nmj93kE36
 gCwhI5m7cq3t8hqKYdq7Q2kKNL+NYj8=
X-Proofpoint-GUID: 32vib6kg1qxoGzPPs2zuD_yvAyTpBDJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX2JJF5naECwom
 vvap9M1bU9hhZ9UaE/lIdNIjsRg6Xa3jfwinjHKuv537fzdQ1HEFwB2mPWD0xJzgDraDItVcnMg
 3Surfb3rOGA/AHWYgVqhnRrAoJEwHEdh9o10LDsl1halPDe4RpjLJ2e/3HSInlnTQAd7sWSDHPO
 RqGfMCBuQNAflUPJ59zWJKDbmyz+9dQS/tEU+PB5Valo3yIWhm+PPSV0E3ME/DBDs+xUTM5ylK7
 JgOTtkKjj6DOhwClngNTRCh9Z1B5/NFl4TXdi0OIZl65KpPojqIbUj8JQI7Oc+QjhJWX+ohToX5
 wETlwUqv4wkeQOm8mIg1nqhYEY/s/5X+E/yUMQTQCR40ngtYZz8Z8r4tbPzW6alnflSByHUsSvj
 m3173383Nj5E89TbOs2dhR/+sFYn9UmeIapfaADot7XoMo8p2rfd6jXO7N8iGwn8WCd86HNKzsJ
 1XMry/pmn6k4WB553dg==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5ddb76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dZbOZ2KzAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 32vib6kg1qxoGzPPs2zuD_yvAyTpBDJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200092
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

On 18/7/26 04:16, Yanfeng Liu wrote:
> This adds optional UART1 to RiscV virt board if required at
> runtime to simplify multicore development.
> 
> Note that UART0 remains default serial_hd(0) and it is:
> 
> - the lowest address UART
> - first serial in DTB
> - behind /aliases/serial0 in DTB
> - the /chosen/stdout-path in DTB
> 
> Note that UART1 is placed at different page from UART0 to
> support page level isolation.
> 
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>   docs/system/riscv/virt.rst |  5 ++++-
>   hw/riscv/virt-acpi-build.c | 12 ++++++++----
>   hw/riscv/virt.c            | 40 ++++++++++++++++++++++++++++----------
>   include/hw/riscv/virt.h    |  3 +++
>   4 files changed, 45 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

