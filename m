Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C5CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:31:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBy9c-0003bW-GP; Wed, 30 Sep 2026 13:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBy9b-0003az-1m
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:31:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBy9Y-000839-Re
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:31:38 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UE0KlV3943265
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D1/7ncQxClU/Jom27+oP/7hAF+rCqUbH+Aah75v8h+8=; b=eN9LZZsJq7/fQE9I
 0u/SvASVO6aMnLmWZqdXETVR9RDnRlW51R5XZkkhfGnBVUDPKilQ5E2B0LXDT/3P
 0ctzyiwOZMoWBc4TypPHMRuQ9jYD1nCVHtpuTV/HECi6B3FMszbblHyhL7fKwRE7
 AvS3w4bMhCO5vLsUBi7sKdUwmuvtjOxO51dD0pf9fkk9UZxCoV1PV5foE3BQcUn/
 rrwBMAJL9eEWyobq2Q5f0+7KdM2kqrekmjmNl+HihrqPSQsWOcvsWWLjSqmRSgU2
 ZC2Yqj+YRNJcEYjyGeSju8jTbUTaTh2neVY2VAa86+pEZuiA6ctydzwl92Gcu4WE
 1fENQg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bka01s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:31:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-988c61af159so240917241.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790789494; x=1791394294; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D1/7ncQxClU/Jom27+oP/7hAF+rCqUbH+Aah75v8h+8=;
 b=OSMQoQH9jjLLbBAsjID4RlXEh7beXEZZNU+D9jgx9D6pYvHw8pZ42GU0EeuIsyhN/H
 DzM3d3HO1pFBsg4ITtperkZvbu0w24Ku6zw6GuI1FKmPMgnFA/uP+ikXXjJ9PEEKUK2p
 pP2Z/NoSg0lKgBUz1BOqEp2K+yer6b6THniTBpz9NFrl0EsbiCDOZq9X3aqF9gCMkYMY
 9BpqZP883lIl3P6As1TWZy5y4LDxLqBga6AIrngz5pFzccOMUiEm9gyC6vDotlcdhhJy
 lXxQk6cv6E6EkR2BxHxxCREhGRaJR3x5yYfsQV3n7gqoolzsmbA2DRORTRodjMRMw/ND
 laeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790789494; x=1791394294;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D1/7ncQxClU/Jom27+oP/7hAF+rCqUbH+Aah75v8h+8=;
 b=n9dwVV9DDs377wPtaW+AVnxD1cfmi1N9gTSWfZPoYO05027ehcTG0HiynshUmoM4B0
 VZ/+LNP8EMrzd7M2Wyh9/P14EfqpgOO1WXz5PIby2MFqhvdPNxkczwUVHsGvwvFRMLs5
 nlcpRxLs0hbCyySbs46mnwwtQZB8gEGfUOiDHKAvILKYrLy80dL56wDACj+51VbQZWUN
 iYrNCSoHYcoWDhSPhZ4cFyU6opE7OAf7m7lhMBaNp91V+CANNkWgPVoZBh7rqapq35cy
 MMT7E7C6pDXestT5RiJlrBYuVisB1/UxdBA195XOB+ge/BLwfNCChmfE3bQb0VeC7grO
 xbaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2Qqg5aDxH+B9rn0FHkPZ6+dozKcuKu+2051zP/Ju1t+CMKvJCc14nX3aqG27HRwUucD8c2PVJQUie@nongnu.org
X-Gm-Message-State: AFq9FYLxIO6qP5l9MvGcF1+SKILE7MxKqMxZXsje5m4vgP0scrx4D5Lm
 vFDoSFUaemzsgi8bUthGZaPzF1IjhNACYhsNv7/ITihEyjL93loDpdp1O8Hpmd05Ften+ydxyTi
 rCJBqLQ9RLbOnmYEI1usMvQDbEtLtgSILfCXtaO5qA1wGuCLn00nZcr5Ygw==
X-Gm-Gg: AYBFou2YOPbfiR/N7VCYqXMga5VfILZ4wicG52Rq2uL/q2HaOcJhT37BA/KJYuFyqnF
 XaMD0gnF122MhzJ12wljz0D2ACws32EaSYwORbhchgWEMOpVx/uojLAmTTd8jAfkLZwyZN566iV
 ufg3VUL0m9qNRjsuT+3yD6OMKsG1236Elm8eHF4Jol5+K3Hts3vkjZ3jsO4rJsnHNCQCaomQ0Ne
 ZlIKmELLUKBBpNLVnm2xVTsaBOBeBvDYJm8Zxte66dbJ42hGoosSBdcCTvz/vJcu6xFGQAy0g1j
 TGoA604bq6VcpKNoWoTn/GZlshxr+BWz8zw2eGlzIbflX/jlhEPQKwf+hIHWbV5AzcU/E/v98EQ
 Hlje0N3Nm8fl+D1ixgiZNccq5M2BzqfOMGQ==
X-Received: by 2002:a05:6102:b11:b0:7b3:3b4e:e4 with SMTP id
 ada2fe7eead31-7be61e97b3dmr545241137.2.1790789494188; 
 Wed, 30 Sep 2026 10:31:34 -0700 (PDT)
X-Received: by 2002:a05:6102:b11:b0:7b3:3b4e:e4 with SMTP id
 ada2fe7eead31-7be61e97b3dmr545204137.2.1790789493589; 
 Wed, 30 Sep 2026 10:31:33 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb717acsm6774925e9.8.2026.09.30.10.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 10:31:32 -0700 (PDT)
Message-ID: <cdf83c82-5f26-4e06-920f-5596a9e3560f@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 19:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] monitor/hmp: add CPUClass::get_pc fallback for HMP
 $pc
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
 <20260911-query-reg-v1-5-0c04f0c02cf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911-query-reg-v1-5-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uFf3dK9CiYbjDH6JEBkaSSbEFIjZv0jw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX4g7g7USR1IRz
 4ZZyzmwlC5c1DXvbdoe98fwoSchuOLbuuPcd4PRrULhEzsiV6DVDlcUePZyyrfgYHYTRo5gQwFM
 SRdibAWyl6ylas0yKdfPErU+ELuofRX0jdoQJF4sh6BNzJ+Jlvm5oYEg++39q8YzmyuZOiDiinT
 ZdM6tPFTuGX8Dx+DeINnTklDeRkJ9JE646dE0d3Z5BQnk27Z26QSLwri/lxJTLVWuAM17EMNqKd
 zA8bncQPZaEZBBmv/gXG3QIflo0oQMsa5vGGY8odX8j0cvgaf/5J8Qjd6RXEa2GhueT4ei7MxUA
 kUYACv59KexdFQNcK9X7DT7D/PQrVcORiBoFfBM8omaQcZrMXKv1KDAnABQ00HsSpCMbGOHTQMv
 h2qBW5yQcebkly3lao2D3Za3LRGjEWy8AVLk7ApiOvWd0LRD/Ye1bLYQuy7i5RvbrX5l7R0YJCf
 vKZs55dKNfDU4xLVp2A==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd4776 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EjW4M9xKZJ0X6a1vx6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfXxe2GRzy7DyvQ
 j2mgw+fhT2FiC3FJMdMZcNVUHz63/M7KCM9UvEdRKP2lyr9F2eu6KJK71FybfLXjNxwTr/C+JMY
 gQGxvOYhWR/6btA78UwMV72LXHXRHZE=
X-Proofpoint-ORIG-GUID: uFf3dK9CiYbjDH6JEBkaSSbEFIjZv0jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300069
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
> Some targets, including x86, have no GDB register named "pc" (x86
> uses eip/rip). When the GDB register lookup fails for "$pc" in
> HMP expressions, fall back to CPUClass::get_pc so that "p $pc",
> "x $pc" etc. work without relying on the legacy MonitorDef table.
> 
> This prepares for the eventual removal of MonitorDef while making
> $pc available immediately for all targets that implement get_pc.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/hmp.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)


> @@ -435,6 +435,10 @@ static bool gdb_get_register(MonitorHMP *hmp, int64_t *pval, const char *name)

> +    if (!strcmp(name, "pc") && cs->cc->get_pc) {
> +        *pval = cs->cc->get_pc(cs);
> +        return true;
> +    }
>       return false;
>   }
Before commit 57206fd42a0 ("more register values in monitor") we had
$eip (32-bit) aliased as $pc, but I suppose in order to add the 64-bit
port (see next commit, 75dfaa1e64b "x86-64 port (Jocelyn Mayer)") it
was unified as a single $pc instead of adding the corresponding $rip:

-    { "eip|pc", offsetof(CPUState, eip) },
+    { "pc", 0, monitor_get_pc, },

This was 22 years ago :) With retrospective I'd say a generic $pc is
misleading (note, this is only for the x86 architecture, the other
ones don't suffer from this problem).

To be pedantic we could add a 'const char *CPUClass::get_pc_regname()'
helper, but TBH I'd just drop this and let the monitor reports an error.
gdbstub doesn't suffer from that because EIP/RIP register index are
used.

What is the community view on this?

