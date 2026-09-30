Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16078CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBxx9-0001DY-RN; Wed, 30 Sep 2026 13:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxwv-0001BW-04
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:18:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxwt-0006Zb-46
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:18:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UEvG5Z273597
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0B/svRjfGQYL9HDa7djfpKhodpNOeQzj1e9+Hre0Ayk=; b=IOnkNt3gCD0raDo3
 +0E8Mnf4rfb1EVQnkHQeupAf3m+GiyENqkfjbdFPvXXHyUeljb4+1Ed/WXx+eeza
 RjrUzhWLU4VQ455jgH+iCdbMFymPlW/uKed9FcxjabnzBaXH6RRh/mF9OawJWb1w
 lT8KwB5gjHLsSBVv9X4RtClrO/w8FzQtWZizNLIuX7jM554qZnZXSeeDFIGxBOqY
 ObYyZ1GdvGn0eb1DXMpNl+o9p9LzJvBfKrsYYx3MFtrYjbY/Sd2PJ7s5YmH2me+9
 WDY7jG+phzbyzW1xotyDJvvtxPD9rFNcNVh3FCAvwGlfotiQrz7gB3INRNks1+h1
 yVyScQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n20pwa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:18:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so1119595585a.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790788709; x=1791393509; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0B/svRjfGQYL9HDa7djfpKhodpNOeQzj1e9+Hre0Ayk=;
 b=aZWKM5PwgCB9dLqNQeEikqiKqql996NVjxa7nEeL+LZMdnWOAZ5DO83/wyVcqs8JA7
 2PF8eEiWoaZmUNSefKHtNWMod/MIUKVyzPJe7NfRpG1JLxFnoOARLtGlcX3tG62QjO40
 nNkE+ZLdnJETzL96iepHIxuwFJk18HsRpJqamt85YWaq/mUX6epidu3vJlPc1yEF24/e
 mJBLKaTwS4NNo7ezhq4JxoVBU5IyKLseNpvdxDvbZvQvPg7iRBoTUDgE1NEajowzPlm6
 ZYcih0iEkmZM8PjM2GSV05oLP0DtXPA8UqV+qV3oEEsDZ8MvoN/r7B2IITC+9nEbjUCo
 8+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790788709; x=1791393509;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0B/svRjfGQYL9HDa7djfpKhodpNOeQzj1e9+Hre0Ayk=;
 b=Fuc2r6e4u/SPGYQkeu4OBUF+2FCoIMA6EkrBxXpyIoTB7mhRXJ0uCGNWfIqNCDAAqX
 HZzXA8ht71CgL7UTm0nZ9a/2RD76YpfZ/2kMkBXKBKgYPSWXcp/9cGtEsT5WcDO6l4iw
 u/cQ61Us3QVhOrM9Y1HXlP833sfzEMaguLah0H9ejmvwf2hdzmW3M9necgO+lGfyMbAA
 FaSgJmZp+c2RbTN1G0GjqsBXIUlN32DmpN/J/RvxZTsrqLDOfB6mu2cg0qz7bLQyGgoS
 aW1q3QUUvvT26+EPrMl/8uRyXvWiyGsrvbPzdMZGgCEboR7eU64s4X5vvFPe7lgU46vj
 Y82Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzz4Mmh6jxMJr3d85X79ntoqz7BK1GYAPxKCDlg1LLZtgiP173pYndMe4FbpNwSjfRX2B9t1L3Q6+MR@nongnu.org
X-Gm-Message-State: AFuF++nAQIWFOZUgh9lgQzz0bvqc73aQiDTLs5yNFDBW0yLhpHErcqo9
 JXHc4cz+2TYFTkxqObrC254qLKoQsLaE1s8VZK8rN1V5nmYwtBYPqbQuIuOCKNE7+5NC0gIMlgU
 ZoDIPJ7HqAWaI/XzTb6ofhlVqduHI0YzbHw2yt6JADuksd/W5wlVXhvnZ5g==
X-Gm-Gg: AYBFou0FHdWAuMLzI/YN+88p176Ok5PEDFlTiMJqt9z/pdc7zWS/+veZbdrt46vEakF
 A5n+CxeTGMZ2r/1ydicwKFy1Y6JEef8/ptVfh8WJ0d+SPSypZBVig13G6gSpUkKDqK+eXBJYJuy
 97Kn3p6ln04Yf1xC4k692dufWAavr5QHi6F1Nf6Y651Q7CuUb8+FRwH+J76Z7oIqPGrn5hASLTi
 BVY8I4v1STU7Y4B9nw8SDpsDwBFyq1l8FF/sR0jnmuH5c/drTCwwMfVUhtiTHpqrqI1fKkccSyf
 nWq8ELyWQCpCtQbQv0m/6ehISQ6LPBWUcdzOHA+pnrG7w175ncN/+QdufzPEWWfRLjMNLQQ0T6o
 J09fPesOD+J95A2Nf29kdC52tFneFcaP6IQ==
X-Received: by 2002:a05:620a:1a24:b0:93a:17c8:a1e7 with SMTP id
 af79cd13be357-93ca983de00mr367088385a.44.1790788709442; 
 Wed, 30 Sep 2026 10:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93a:17c8:a1e7 with SMTP id
 af79cd13be357-93ca983de00mr367078485a.44.1790788708686; 
 Wed, 30 Sep 2026 10:18:28 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eba0d3csm4992075e9.6.2026.09.30.10.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 10:18:27 -0700 (PDT)
Message-ID: <5c687bdb-9a3a-41ba-97f7-8ff8592e0eb2@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 19:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] gdbstub: set feature->base_reg for dynamic features
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
 <20260911-query-reg-v1-3-0c04f0c02cf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911-query-reg-v1-3-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abd4466 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX4FFVfta/LJGt
 I7YfQTz4Tq3GoRhGECQQRQkHKivvcjpeQyLHJjJSU19HYDAMTZARK+57U1Vsu9I6TpkQuMMWvqy
 OSAxAbUl8JhsOpUugGz7cwx36T+/XWQ=
X-Proofpoint-GUID: e78INWGu-wu5rkS9F949LyRxfgDdq4v1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX41vwD7dXtzuL
 yEQaChvHgTlB2y013+/rlNVQdsubGBU2w35YznwmwYpzt4gvG51kWf5TMntczD/FtgPrwlclkj/
 XzyOmj4vEtmmfzdYyPTbzykP/PqLfKSR5cpSEIE1k00QIUUm+MVWdrrchXn1w//CXJAYOeq+jqK
 lBCkz5oCWqdSfLUtISiUyjxVUF9mA/6P9DGAE+mKQWBUrBI0tz9br+1XjQOqkEZ4Qw+4lIIrPMP
 J0Y1hI/U4CcKh/9i1St7bPsM/BBhx+jRIUSk06uHA3e+NbwJWFm72l5LaQOhBIMde6yvQZQjVhm
 EPwJlGuWipcq+KVbFgAMqv/ihF/fiBTfTZDBfs/phKgqIS8gwgJd21k1xKGNdf+gzIhq0/ASLZt
 /8QK+l2QgbAQpmgr+poQrD6Avp5uJ3FCuWM5Lnk9fhiClSieAozDux3u/REhubDJph2xRcqHl5u
 urGRb4G9aIyNG5uLtXg==
X-Proofpoint-ORIG-GUID: e78INWGu-wu5rkS9F949LyRxfgDdq4v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068
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

On 11/9/26 14:27, Marc-AndrÃ© Lureau wrote:
> gdb_feature_builder_end() never propagated builder->base_reg into
> feature->base_reg, leaving it at 0 for all dynamically-built features.
> This made the trace log at gdb_get_register_list() report an incorrect
> base_reg for dynamic features.
> 
> GDBRegisterState::base_reg was correctly set, so this doesn't fix
> an actual issue.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   gdbstub/gdbstub.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

