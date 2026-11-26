Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0017606A333
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nLMnagva;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIJcTmYX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWbbK-0003Cn-SH; Thu, 26 Nov 2026 10:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbbI-0003Aw-Sc
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 10:41:32 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbbG-0001xV-V9
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 10:41:32 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQEVYw93298770
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=; b=nLMnagvaDP2JCvyb
 Lp+OH7tBzAs+gg94hVQ8OQJQJx1k+5fdcmoeyiJXP4hWTmrIHX+cP3qtj/c0w5gB
 J8gnUhI5Qn6YncKXacF5DDcxAFrE2d03+ekl/vuzn5RH1TSUCp3XQu+GAKvIkvFg
 gi7B4zdBaT9HXPqBL4QHIqz8CwkVvQyxbIpfCgPVntXbsV9zUQ6X906CCpO0dcu1
 W4uvUiFZC8gSWZhgHLrAaUba9DYr2UKZjPUGUWkPFIv0aUjsS//Kp/k9xoYX7Qxl
 Mio5QlafUKlbTsZOHGZMAzRUMSwxaiGUvdNGNzsK95URE6/lNz5/cZIBkM2ps8oh
 LcrVBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02vrf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-94a1db3cd3cso10070585a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795707689; x=1796312489; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=;
 b=HIJcTmYXdh38ETnv/mJkaCbaTKHUHfmEl5ph4b1bCs4JnjelcgbHpbg5daTl9/EMjb
 VtwgJvnMvts0WLPpMTNXHsi7OZVuL2De8kBVKXkI5LDyPTL8RXBpoLhgM3WxM4T9WRMH
 Dkb3VZ+whFKWV8/93oGuw0yQK0fgz8C811ep4bsdCBfeJ15y8fHVqNI0mrsIcaXpqx44
 WNMbjZRMeBJh56aYRij3PUm3lOkEdzclnVGshQJ6E2pBhzFtjSsLQmdiXNcPMp35qREH
 n9pYFRUxbIZah4hZVg6fvmya6onHAKfErEsu3TZVTdHYjATo9qgVylzZp8+TWQEaa8U9
 D9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795707689; x=1796312489;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IQ85ilLmMN0r86RviriAxcHemBHLrPTeGe2iVuPQyMM=;
 b=r45mstmZhoWATfe56LcyFWtLhLEiARebJSCr3kLTil6w/J+bBYRc9YOYcg3VUyNpee
 8l00b+asgDZne7kQChA7pMxqDkTmZnvPmnLmFAWPsysR5N40Q9UNuVY5rj9sOeDaXftd
 2xaNB0/rUQOaSAH4fFRuhDtuDbZk0rhvJ9CKvnGvLVTBgEiN1fojXPfKP8ZK96yyfemL
 nRq2cn/XFfcRG2nHhhk0+vlMFRYO0M+l0o5mKdcwqrTfs3QEBktQo/RwSlDgP0KHMRjz
 0OZAC8+XTD2WbXTp8wN8idov2UkFoUfSv6hlyOu1ipl+iMovZTUmbHUkmunkMSrAWvS1
 P5xA==
X-Forwarded-Encrypted: i=1;
 AL+hErHJ8uFynN2P6YsROEORODtCFeZC8+s2SQc5KFaMKAB0TVmbHKYs5Ww3hGiCthNp3yQA8c007dpCaK+A@nongnu.org
X-Gm-Message-State: APuU4Z/Eer7BO2y+7VUWdjLipI7mE+T1fXveU9es9fV8sVerOkRJgjlI
 xdV7tJFtrk0c/YEPgUDZ7RLmc0DM78yaG8nl1g9VIZ6mYLmGNm74tv3njP1q0X6OxoSLwx0s6uk
 aCBwXUZsB/fLyrtLgFDq97jpntnyBLzmsq3d5usXAKrdMMrR/ZqpqiggSag==
X-Gm-Gg: AZFdTZdRAI0kXK98HsjSdkVOuCr6GEPZNfbf3RdayVOdCs1KOVsOAKoCNQo+qbCqRtJ
 f2Eq0RKS1n3D0o8EoeCDyhhArzmSCa7+JMTGnlmVqMwlf677tTsHE1sAVIGnNxhtHsg/GNnQ6e8
 dm0qaJikPtUazo+bxabkUGrnN2FqGeUAXwBwrWWVRxVSMYxZYVp8+11qEQzRpPHrSwekpPBbz0U
 bEJemRTnf9utzxdi6O0muYdfGkwn0khP51NkPTXf4hY3bfAVarttLu76xOowFbF8hJhMZh6B/cd
 xmljQEUD0RUKiH4bue7RqwmPz5qMjcZburZk3D0nF19vGTvwIspqHhG1UCfugbk8I3BmdsRJ/z8
 HtuLB6mrdkYEAFT0XlOGpNwGSpsLsIzu2o0AKXhMFaL1ZVdACkFxpHnl6W24N37yivmT+12Nzqg
 GEQB3FV0c=
X-Received: by 2002:a05:620a:17a2:b0:947:a247:6afb with SMTP id
 af79cd13be357-949ba965b28mr3889349585a.13.1795707688659; 
 Thu, 26 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:947:a247:6afb with SMTP id
 af79cd13be357-949ba965b28mr3889343785a.13.1795707688221; 
 Thu, 26 Nov 2026 07:41:28 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm957744665e9.14.2026.11.26.07.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 07:41:27 -0800 (PST)
Message-ID: <aba99506-a519-49dc-93e7-1e45c904349d@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:41:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] MAINTAINERS: update Daniel's entries to be consistent
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
 <20261126143607.2374676-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261126143607.2374676-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b085329 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f45CAlVN0ESyyzyWPnoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1H_aF7d5f1B3KTYVvTvPep0Kv0i3Jfc2
X-Proofpoint-GUID: 1H_aF7d5f1B3KTYVvTvPep0Kv0i3Jfc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX6ETwk/BudZ9J
 GZXGIxUW2oLcVMsada8TNJznVZr3hf3zBvNqh/e7Guxl8cfX1yO4KLse3u6tp/OTYFnpfxQ0oQP
 OL6ASCeahjrLio+aIEgHweNHMjfu1AIahTGqmkXLCpkzWhYXEjhxSbZT/Uq5ueSuoYoFmXgCbYl
 840CEEOQ9k2SNEph6vy3CBi1FQmgg03uDX9EpVBqN4dx0WEgrn7OzUsq+6tDHN5LGFJZDPXz30k
 4tmqtzG7zU0IVNKT5nSls8DUr4fdWmdU8uc7JedIbCZctSUJQCtayKU55l6TI1XxiG1JgXh4RUC
 7yXR/6TO0n/Z3fT+7Xahb+HyD5zV/XajgslD6uz4RSYBzR8SkgQg3/z70O4YOSdWctY6wl5QfGd
 aFopIbFh1pxEKS4HBbkuQbk93pF2dpJqXZCzCa0ti8OKu8gxryWp+c22D3B8AiY7TI1CybkNmBh
 v0EGAqzaWjPcBWB20+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX8R7FUHQM+9Ez
 V/RF0E9frjdBPLOYtnPgBR1Lz2qrBRaUwc7hnE0lBJOdEiSCtV5i0jgOO7uxrIBw2W5WigRlpVs
 Kf78L0HGOh7KJvOCz8vgoNTF2HjXNeA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260061
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

On 26/11/26 15:36, Alex BennÃ©e wrote:
> When testing my get_maintainers.py I was shocked to see:
> 
>    ➜  ./scripts/get_maintainer.py --list-absent-maintainers-since "2 years ago"
>    Maintainer              Last Seen   Email(s)                        Subsystems
>    ------------------------------------------------------------------------------
>    ...
>    Daniel P. Berrange      2024-06-10  berrange@redhat.com             QOM, QDev, Seccomp, Cryptography, Buffers, I/O Channels, User authorization, Sockets, File monitor, Functional testing framework, Build system architecture, Meson, GIT submodules
> 
> Which is of course incorrect but tripped up by the fact we have been
> utf-8 clean for some time. There are some entries that are correct so
> fix up the rest in solidarity with my fellow utf-8 using hackers ;-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-ID: <20261120182200.789086-1-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

