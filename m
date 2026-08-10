Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE818C5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:49:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtG4N-0000uk-A9; Sun, 09 Aug 2026 22:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG4F-0000tr-Vl
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:48:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG4C-0003zG-Rc
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:48:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L7VBx3793037
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GmsQ2SvKIPze/iyyndazYIMLA4wGsLZWz8B+Cf4r/gM=; b=n6dipVC64f2qstcy
 rXvDTPJrazhOnf0B+zdDtR9/1IfGJ6lt4IdNTzb/PXstJWXB8jWe114tJn5SAzGb
 TkLJ1L64KEY/D4sdOtFmAUYJVtZF53tlJyQ0+ZDC4/Tg6tagFRmIldmnPCkqVnRV
 UQpZMJUSTnLDvjlFLzx5H1Kt42x0Jm4IzQNq1hx+xe91a3/yzWZv8Es5ADPsxoVW
 OtpaKuMaHBKCteGzTY9l+bRyQzLoR+ZiWqLoq5sYjTBaHIGY/v2Q8AgMm/Pkdsgp
 fpU1tDvcl8CN17Aa5l7b7x+zY36WGyihL71aa07QyZkDbZg2Q3wCurRp1xLw++0T
 cvctzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp4ckr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:48:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8db414c7so21080371cf.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330123; x=1786934923; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GmsQ2SvKIPze/iyyndazYIMLA4wGsLZWz8B+Cf4r/gM=;
 b=Jmc4aLpWUo80taZ3u+7L3fts4MUAivUoGZWOzsg/6recj/1duXKkZXeRfAQjxWmeQZ
 DCxhhc+D7nNMBCjvCIxm3RkTs8DfupiBrh1OFWAAi4t1/zR9g/eNGhz/HpF4mCzkCC61
 DU/ql9KdJyKIflVTc6s5X4ZMfDht+udeR0IED9PsjLfYoNrtHhacjz9q9MXKU5b17GRw
 WJMWvBX9mQR5bhbtdFMFR7p79/BE4vgxO1YU93n25LDZ/c4L2SmiFWrbSl1ww6a+Uyo7
 pvuOz+H4hQDOMle2MKkb/9ErHsYMBKTRIo3AjiCSAD7H/CswX5+TjQ3B0bPDeMWphF/n
 p0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330123; x=1786934923;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GmsQ2SvKIPze/iyyndazYIMLA4wGsLZWz8B+Cf4r/gM=;
 b=DuH7VZwnaNRGcKJgqxSmKvv1pYKMc3OGdCBpS8k6OJWlmXzBnuzqV3OesfVKfdaG36
 hQq3L2NpVEwjf15fY0a3dkXWa+6O+8wH8OguD5CRzZVjZmQrDBZyTyvgDytsyMNMdl/j
 V1odXbwpJaBVrLUxMGFqcsgieijY3QIGrS2n49Wra1Jalbi7Q+qqkOh0hg36ZMuVR8sD
 19FKBMxQaPASpWJTkEdCHjPSP2g08VbUCeR+zNM+NwcTAFXZLU2tfCbsXP7sx1eQDm4I
 DHFMTSSj0/oK+25qRoTESb860RkzIIMHjnnHrNSa1FxJH4hTUHzBN2yDXbkr8mSRws8a
 Cvgw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYxh1Pc6duzkG8ShA1p2QwYwXQLWmy+U7Ld4f8c7dZLMjoez8xeqhMPTKgK7kWp00uk1+lTyauhRyL@nongnu.org
X-Gm-Message-State: AOJu0YxNeRA+RVGWaqpXFieFezD3+pbdLwvWXOBG6lQlMUOXVsbp7HBw
 5V90fMr8NT1Fw1JneYGVYsz70W+f3hwxzQkmiC3j0Gjv/vED5Ab0X9xOSxI2G18xY6jvcDkQO8J
 NgD1xJd5IvEnC2KuzoyboK8Fp8u3zzYTV9+NXCnFjGDulatvBhVVToO9weA==
X-Gm-Gg: AR+sD10C5fSGX3Y4aryGPPJgew9ST8n0z6ACK3tkQDVZQLTue86mgapSBdWg0eTR+nY
 hVWA9C0RjCXJDfz19686oIn9YWeUyTaqG80AeFBt4OL2SJ2aZ+Zh/A3kaobHyWkHfeV5BS1XMTP
 0esbEh1MIonpIMFtS1kmtulkgP9Ta875KWmjjrkU1flaaJ43Q3t/2U7wgaF40UXPVdzoeaXpp+l
 9uspDOatjfi3WhQRtg/SrLxKN+BS5DOJG2afDcQTIrj6qscsDFDtxAhy2qzhCF1geU8VUUMG6DS
 e7ADG6QhNGN7lJZHwKzSWYWmJnMDLSrkawLZPzpaOj9fK52VIm99hqQ2A6fN9VVuEHkM9EdcWC2
 PFUopvoRIs5xXsj+OVSqUSlAHifTcWSsAC6g=
X-Received: by 2002:a05:622a:e110:20b0:52d:2b8b:a138 with SMTP id
 d75a77b69052e-52d2b8ba282mr83503161cf.26.1786330122991; 
 Sun, 09 Aug 2026 19:48:42 -0700 (PDT)
X-Received: by 2002:a05:622a:e110:20b0:52d:2b8b:a138 with SMTP id
 d75a77b69052e-52d2b8ba282mr83503001cf.26.1786330122620; 
 Sun, 09 Aug 2026 19:48:42 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea2dc4esm285766505e9.13.2026.08.09.19.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:48:41 -0700 (PDT)
Message-ID: <bd582515-1a7d-487d-8811-7b036f3352fa@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] disas/capstone: Allow for cap_insn_unit > length
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a_Z_AM2DMkN4grw4DOo0hPZEPhQtD79V
X-Proofpoint-ORIG-GUID: a_Z_AM2DMkN4grw4DOo0hPZEPhQtD79V
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a793c0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfXwJcwBznhPlrw
 cCNlsy5bshV9bhbRK+8dtEDF6LhowipWv9rkS1rTwEuy7+cdOuc087GhxWb9aRdz7s8v/+cnIht
 Qiyt66YwqhN4jNi2eaXvCBWgNgGtzRIjuMfwkMpvWrQto7+O0rI4roh65CxzLLJlAnwhMqoXePo
 3ZIBMwiQmZDjy0PFnYynDLY99cWtDLI08+Kpe8OPfxDQY3A2HcNz6j1AMCDuLrfpDEMcX8VknWj
 eEQM62Jizub4WHeI0l/ZZu//fOnKZf+uDxDG29IkJ76+nKMsyC2r92uB2Pi1IBtA4Wk9P1TYgyb
 PZU4Zh0Ikhb/QNFHW9TeKXkf0xRosMXOhF1sXoP+ITppxVJnH8VPq5ySR+uVOZzgqvoDTu2xXpE
 kF+k6BBaKj2ScLO4MPNoPjD6KWqbHXY4NO7dkJmyDb0pcPW3dBRp7qtv7JH6gQ89e6QoCP+hvs/
 6ZheEU1RGeGwtFQGUmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfX9I+GYFBCpNq0
 8ECpLaWmD5hSVouOB1tQybnqOEflhNbPFgg3EZIwKqYOMisHo4ka9aPJ2YYgZ7+Jm2RAXandKuY
 tHDTDAXJESIj6BwcOJuRaFzUc1XAl1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100022
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

On 9/8/26 03:33, Richard Henderson wrote:
> cap_insn_unit is designed for targets like arm thumb2
> and s390x where 4 and 6-byte insns are displayed in
> 2-byte chunks.
> 
> For riscv, we prefer 4-byte insns to display as one
> 4-byte unit, rather than 2x 2-byte units.  So we will
> want to set cap_insn_unit to 4, but allow for insns
> that are smaller than 4.  Emit padding to match.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/capstone.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

