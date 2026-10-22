Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DE606A320
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpA8KNfj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bjmae6NU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xK0hm-0005ZR-TP; Thu, 22 Oct 2026 17:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hS-0005Vl-EO
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:51:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hQ-0007ST-Bu
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:51:49 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MLDqRa1357958
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=; b=UpA8KNfj339Yzy5i
 ygfcbfm2hutJ96BjW8dP7UTpQN05F729OSe6O+2hjPxKW/5nWuefSAk61+Z8t+Vz
 AgoHL/q38M+w3FVZFMojnXHTyNHPAVSm8s1walVDRb2estkI1ZsNtQfUiXrKT4HO
 6DK6EXoa/fb4K73Ow7yQtIk13+5gjX9uvtR+RjfeWQYOAvPl7AkEH6cp47p530rX
 nHUfAfOSy5J/6q7R6r0rdQSvmNoQJUeM64+n6gSPFZNl1NfLYW0KiHMmPHJXQI1H
 K3m2dzyA2d37TFOHVielSjprPmDkpPwTuNTzBJVxShUOxRUzR83H/9IWfO4EIlLP
 KJttcg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj8qm3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:51:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-351788121cfso934118eec.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705906; x=1793310706; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=;
 b=bjmae6NU3XuSmQ10cpD2Kb81VOMt5PaAIGm8fHpU5kF9Vvionv+Qs3WhZtc/BX9DAa
 GSRE5PUmxjpiFBDRfZyXOOI2/XHjFOn0jA+XAfHqQzBXINSEREtUU94kEDmML+iRndTz
 Y6z5kYvL7TIQMB+uF+VDSp5lMsgp8zF3BzUntxfWMWy3dMHO+8nzij85Jr69HtQo/qS8
 iDKciZKnDOen7O27wenzyGocL20mW+ZyOEaSPMiAagDNhVC8RGi37dYCwRt/dMa06Prm
 ivDjn63jYwa4apok4ND7ygcJTLFi/zvW41yr9yfQj0EXh2qorobvpKj1FcF2fNTfivZQ
 rFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705906; x=1793310706;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZJ0vAVBFE/gA/LBiAxfTUL7mFi2bGgjivHMnOSJrEJw=;
 b=f4I0M3eVL3cEhmW/onI/6T0JozD86k39YmOt1A0qIHeL+Pq0gplvFZeJbdWa128qKS
 357QEt9biXIu/zPfh1gwFJXevJgqT4+fbyGVP0BZBjmyd000+z/BhgYiFfLd2tCJNYbN
 FAAx17nJYy0hlpbSwkOzIhlOQbG3SoKwJ8NLFDTa0CPoG8gOc2G+PTlh28DWrhFUt4qs
 m8PcbDC0q5oFarv88pDUHR4wmcgNtRW9qtE6cdGHQJjmWysmHHe5WzH2lEm3HQoqK0B9
 cgzfN8KC96aaRjR0TVXALodvWOieiUJd3Xpg2lNJVrTYjLs4xA1Fs2wwtGpiJFnQLSnB
 MhhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1FuakE0gcJjNmuQlGMrIea6suDprXuR+W/Kzs2uKviV3T1yLc8Rw4Ry90/h+YR6RWbi7gJGmyOesA@nongnu.org
X-Gm-Message-State: AFq9FYKqTmzybtC+/bNbuI3yT5xU4pz2yPNSk1uA5kZGMBV4VrlwdKQt
 JUxH7DMuWfN5A0cLEZ9nkIsr1mG/OqwvLJ9oxfv35uaf8HBWgmnINn7UnFF2g2zbAvRdJ7Q4lFh
 e7Hzv1KIcH4/jAVbkNtUu36HQdvGJGcuJoSq8Edbr5C/1VGMMvTtYIa1Y2w==
X-Gm-Gg: AYBFou3dwxlZg3djvYjaekNCHNGRhi3iTcLEFNEshnGgltfLce6wTxuAxC5dGBf24GT
 paYdc9iMULN7fBDDm4W9jno+4CtW4MDhgNfgYGKdv9UEM1wQR/JH4Cy2UJuSdcQVB8QfSLyEQB9
 YtfKQsPsaqGMDB5ckC66lwpKEhSjswuDA02BevQWUxPP2utGomZdUaKDojZ1xHtH3qrzJ4k0qkS
 PLEPURMIXvGaXQFqet/DWskH/1Yjp24H12Lv2a0yGiVsvAzytQyn0noIqbQ8XnsmnO+oIsVRXZI
 e+fOPCP1CTSBCCyru0rRde8F8N2nXP4okHg10K67fNq0bgPLnjFpXomQArn/jmMoEHmAPjRn57I
 B+I/gd7P4XmmRiOs4xsiD6KYEAkz70ct03yRrgM3M3ljSQa9dApWU+R79kuzuMH+AcPG1FA==
X-Received: by 2002:a05:693c:20d4:10b0:366:2893:7421 with SMTP id
 5a478bee46e88-369d971fde2mr509559eec.10.1792705906338; 
 Thu, 22 Oct 2026 14:51:46 -0700 (PDT)
X-Received: by 2002:a05:693c:20d4:10b0:366:2893:7421 with SMTP id
 5a478bee46e88-369d971fde2mr509528eec.10.1792705905753; 
 Thu, 22 Oct 2026 14:51:45 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9dac9casm620905eec.15.2026.10.22.14.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:51:45 -0700 (PDT)
Message-ID: <26ad3377-c85f-4132-a129-7b41d6cad0e4@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:51:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] MAINTAINERS: cover riscv GDB XML files
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
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
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-16-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-16-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4B-7V8XxdcNVmTQExviLYUOVJrt_yhei
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6ada8573 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=pL10aHdrbxYHfr8ulbEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX19o+9W60UAFX
 TIyetUArgd3iThE545B8DyKV6qXNzywBcBZkVwnTf8mAxIIMV1c8z/lrasQF+QN+wz0w4i8Kh15
 sn4pc/AHPvGHutX7HonGJFaf8wlQY9M=
X-Proofpoint-ORIG-GUID: 4B-7V8XxdcNVmTQExviLYUOVJrt_yhei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX84vmOgtu1YyA
 f9KEwMRu9VnS3vg4vS5HVL50zJZZBz+oKXIGjcKLLhLRVVOfDAcasgJc82/J/TIhTEiJW8kS5o5
 TZDcIryYRterGY0mC4ruViiNZzZtTilq7RE68oxMiUjzHyZrXif53OLi/p+blP5lWg/dMCk8aPH
 +o44/udWboXwbQpMw+tnQTM/hR5E5KfyeEbESAokVkxck9pkyNgv4HEZSC6kXlBVBokgGBe/lqg
 tgkIXTIT0/NDtFjrFtacPMhZXBNWe51ZEFs2bxhyJayWfa2RngmkCLcogBxdNSxZndUYdK9SQSy
 YC3mTId5KEx6oAshDl+GGOsEhm8mR4HJw3dcI1NVyYEvUFPd9uVfH64j0C+onOFQa15xQS7p/Mi
 gLqhN4Ld3IJtbv6x45ml7Yrb7Cdu9BxXy0F4Cjb+FmaWcVMd0lVBB8XCF4LqiDNHqG1Si17j8A/
 raTnoYDIiGpN//hptdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Add an entry so changes to these files are routed to the RISC-V
> maintainers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

