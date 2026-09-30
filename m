Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CDACA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBxed-0005RB-O6; Wed, 30 Sep 2026 12:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxeb-0005Pr-Pg
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 12:59:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxea-0004bz-59
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 12:59:37 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UGjHg94035350
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 16:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=; b=MU2+ug8kU3Edln49
 BwrDlKstv5FQTSfyNJmLfihLoU5CQoDK0bhCl8moruQhQt0Xln8H4YUzRtaLNFsO
 FUTy4nkmj1JoU1ttGx7tlbRbD5K5/KfvJV7p7HnC3WsBCrOxadMyEBNWrRKUufjZ
 uDXUtokiAtGsXmtOXxzlnChiNer1g1PMdCL4ZN32DWlJXy+8oYOnwNb5lRgUJqA8
 Y7qr267jXW32DynNH+CUGcLzZoBEBXy39vuSgZNjYy27z7yZOQAIiuF7g1CGhfQA
 0dIQ1hg7e0g1IZmX6CScuZgAAGR6rTKuUkh9a1sa8SQBum8X2fcIS5cW1ybzKv/s
 rYZlLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pg31n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 16:59:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9106fce784dso112709946d6.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790787574; x=1791392374; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=;
 b=h5fOsZsQsHIRWLPBZ5zd68IzYZpBlPtmA8G3WHxZaJIc5x4ujaan6y8dWXwpQD7qai
 ywNs/Tb+s/raXKL8NEAcM/0gij4/9HR0hUet9RcTzKN7vOiwXs1ECDjniSoo4n7J6giR
 9jcmJtWQ0mD+1FRdPd4w2ronQrAUPIwsnRchgVPtE4ZaiQXTV3ftlsoZMfNl0IGTy5rP
 Kdq4a0uiE53NX5pUhZ4xQteSAuqSPJznQOZmKncr/ztrAinLKyfyXTHFifumvt7EE2zn
 eDfFUspREV3x9uLHWtgGrQWoDOd/XLVuvNTdelnvwBG9vBeEpkyaaPx4rbVN2Ums1F40
 D7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790787574; x=1791392374;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mq9+c5qcr5TaQZK4cwINyvrQNaSIiPHnk7fwG7hwS3g=;
 b=YDyX9LQK8HOqf0PcPyLszJldPTPXWQdiIBHlpHelxvYUK1iqd69+wqO8VhnzUMt/1n
 KS/xVwmiKiU3khu8jlHyNz3I7FvmNIgI0tOuEDQg7Szf/YfJ8ID/mfcpBaNgbhXyZuIE
 H+ugHqYian/LYybFNGY6phmwZPVkWd6J0K0MXVZjo8jsdLoFuYgTpBHxggauldQ9baak
 BEt4YEgDnwqVDQZjZz/uAbwCatVv9F0+yB/Nap45Q+zI8oEj+gqVyC/Wi51XU5deo8ci
 bxmwgBHtAecNB2ndST6szufP+QlRA0MU0KXp9HLeUUdLCzWFXqK/4+i1K2oYtm7RNf9U
 CxcA==
X-Forwarded-Encrypted: i=1;
 AKwUvByApnPNG04fl3vIRiXao2ya72EDgayYy1q/VaR0eb9SeT0XrYdDcagmEmXLjeABSq4Bo7raZaHuDm7j@nongnu.org
X-Gm-Message-State: AFuF++lAInUXnflZ6ZwpY7iJyFjQ7ETHrFnME8O2Tk0ulnhOesmZSrqz
 m5qm/wFvuTzv8UKo4tXrtC/gurc+xLHEBgkFvMc3tJcust2bVM07xT06ttT2jqZazhTZ0R2ZTEv
 uFI8pCqsuFJnL1TdvWSa03kxFeGpGqJJp1IA3ieriTuqmT224HhIaJhiAPw==
X-Gm-Gg: AYBFou12TMAXkB8YlVmTD/fCIA8xIgrOFkwq5hUluD6g2/VNa5xlxFMSO9ufs9MMWtR
 cu7QBmRsy9NIQrbOoqBX1SiMft8pTPqSW1JtrTX0nu8KBMnswHptaNkayQoGX9q9cHgjS+y+3MR
 QL8tglh3FzcqPukSGzxzydKfNAocyEpvTaJLA7ui4XocQ1H503wP/Ew40DEo2g1gLdz3M/HLW78
 FZHszPCRquqludLZDCviKHIXOU7lBSzsocXIhVegzGc84WKV/F1Q4nZ3r9jaQuqv8Fkux0UX8QH
 ZfylMSJYDqsyKRtx/BXFQUIVEGzYAM1nBb6h4UXopPGEnBDmEnn5S+WRobY5qqhhdEY7qefLTvr
 RtZnxRhnyvV6FKuIwTIaVJPt5tjALlAyMcg==
X-Received: by 2002:a05:620a:6910:b0:93c:23c0:c2b8 with SMTP id
 af79cd13be357-93ca95018f6mr361497785a.7.1790787573400; 
 Wed, 30 Sep 2026 09:59:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:93c:23c0:c2b8 with SMTP id
 af79cd13be357-93ca95018f6mr361493185a.7.1790787572904; 
 Wed, 30 Sep 2026 09:59:32 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0690e19asm331431f8f.18.2026.09.30.09.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 09:59:32 -0700 (PDT)
Message-ID: <53419ffe-9540-40a5-b080-425c5bfbd1b3@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] hmp: don't crash on invalid register
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
 <20260911-query-reg-v1-1-0c04f0c02cf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911-query-reg-v1-1-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 785oCppA8uUl2ei9QrO918JOx1I5AtEu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfX1IlfecDaHfSf
 LODWRimoW9paIOjD+GgkfaOpghb4hH/stF/9y9P1z9gjpYyrbf87s4Wt6yyCcD4kG7MbgBYgG1I
 vgIjgG/k6j99zVqDhiXnokl2b61dsi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfXyKcHo0kmAxR9
 VRP7m7GMVJa9hlipEr9llfVimaxq7nnahNk6UBjCegbMuR80z+2AuF56PI1PTcKSjjQ6SGlWjQY
 ubEUAkL3sYhJ2CzpfJFSDXkWi7HrC13/hWqtupWGKBew2ZF+DQNah5zU5uSULYusN4iSpQHUjKd
 ARaiFueN2sOtt6VPbg00kNALSWfXw/oAnRjBsejJUEuaU3Zky14D+ExyFUzIB3kZOp57NTgrtUz
 lNJ+HV0Pu67cskVhcuREZPvJElPy9WP2qXLgewbWJfSDPUC5PKl8nCOxF8iEUHjNuKQDcpPf7ax
 UZgkBoezS1ZRVHprpp2X6gaMMDU1DK/tQ+otClABeIAiYWlj2+7wW+a4v/FRWD8o1wYE7oW/j8h
 oN3DoYBI9TgMYERYBLEJVSejbc29Ah8IfZfQlCgRu2beo7G0IWP+fBZCUr4LN3oWSPQ2dFAMMGA
 RCXTFpSr2M05WSZfXJA==
X-Proofpoint-GUID: 785oCppA8uUl2ei9QrO918JOx1I5AtEu
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abd3ff6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=B-miyySTQTp80Hq9ejcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/9/26 14:27, Marc-AndrÃ© Lureau wrote:
> When printing an invalid/denied register, QEMU crashes with:
> ERROR:include/qemu/bswap.h:488:ldn_le_p: code should not be reached
> 
> (ex: "p $sireg" when siselect=0 on riscv)
> 
> Return false instead.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

