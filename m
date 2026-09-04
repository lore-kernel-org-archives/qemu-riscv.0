Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D61BC624D3
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 10:50:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2RUZ-0002k5-Gd; Fri, 04 Sep 2026 06:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RUX-0002jY-Sd
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:49:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RUW-0005n3-GA
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:49:53 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684AIlZC3276941
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 10:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I3Z5ffJmWgePWxgnAIFbt94EjpW7qVI5iVPqSRXnUVs=; b=JroAIMFvBVJP1Fnx
 Y8uwO0c+H+qnkAuFETzDtfkP12jA7S1UNigzob/cn6SDgyFclNYMAI+BNj1OMPkf
 MhqErOySMULGL+PSnkZAbGcn8ckp5Pe812p4tQt8OyzOcDO3cbIOWGM3SXdh3NeM
 nQNlgJT4C8cOvniAcaVUeUy8YBu4KV0y0OOsP03FZ/MdF/6bx3bagCI6h12EMFk6
 NnDSD21DiP8DNhbSL9Q4WuTlGtkTx3YbmLM8rCPNUAC2YEkXScm61tzZufG5ZwY1
 +c2nDk6aEgIgRAwu0SjzwtZOy+FAVzH7JN7cKMXcmy936sTtj++yq3d7yi7W0P5q
 UdN3ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd11un-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 10:49:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-939665a1ae6so219437885a.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788518991; x=1789123791; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I3Z5ffJmWgePWxgnAIFbt94EjpW7qVI5iVPqSRXnUVs=;
 b=MyUJtNMTzBCh+IwL9xG3UOX7XwbZrgK9xJPrDxI8aSfHRuz69sXvdAILD65tnnBIsL
 dxb9P4mpp8rsnMihfEfstfAuU6iWBA1G3qdOJjQiZGJK1vSoyAt6jgFaHjEC0e+MKDH/
 b5pxB4TmuTUwmqVU7PsKP6zZuc0p4vvVll8fs4aX2xonN1BAn0wFS1j/R07Y/u42+6r2
 stWlaNDpd921lAmYzn/bL1IvER9fpreGVboZCefj9Kwh2udO+7e7zIT0eL9l0rp5MSxY
 ydSCcU6I2K/TY6fumcwnFOfs1m5DHPqnItxM001irlmqIw+4pntBnS86nBRmgAXZ7I7O
 lQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788518991; x=1789123791;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I3Z5ffJmWgePWxgnAIFbt94EjpW7qVI5iVPqSRXnUVs=;
 b=UBJsKeVGVCcNdneGPVTWQ/I+PuYT7TS2r+CJi+gBlfpoe8LR6WSUiIGfcVn0bEUbNb
 99jQyM1YVTFBBjNCexRQkqwEu6ZVpvuOM0DRzimWWMrkvLNgvej6oDwfwDqgCpAMemlr
 PICfaJlLwaikRn+eDnuaIZdj3fdsXTVbEx2/1i9QAzf5KLtZy7AHRg9LOXQR7Pjn9Q1V
 uVeFD3o715y/r8PIsbNsxqAPAKcasPEuQaj1f3lg+aR5gtuyo1BqFnJr1JLzlh1cCLJI
 ZyKXSFu+XmceGZ9YzC+OKmVnXaJ24ZUTGf/o/I+S+duMN4pM9CAZJBGb+2FonCA1tSfn
 2Exw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwjhVAkQ6I211kp6pC+UmHvRcciAv8H5GOLJ5hFZMY0iPeOE1HYhGaOe7F/uczaokFGlRK/NJp+vOXR@nongnu.org
X-Gm-Message-State: AFuF++ninFulu+m9mCoZ37g3wkAtxoUOAcSgMaE5Y+beHeSf/U+mDRln
 c0TVMnOA3G/qNty8kqdswclNnXTDkGeGpvXSVeR6c5lma8tjdyMhRbFgrWYtw32fAc2cQKNsvUY
 GQuIGXBWJMAIzGskYMYB2V1LWrU35f14xnbB52cJHqzudk9RcDCF8CDDD0w==
X-Gm-Gg: AYBFou0NXD9wshoVbmd0xQUnznepvy/5GLZwJO8+vGOwqd75r6UZhtG/u7tzEhDuzZv
 M60xpyOtYvLsYIh2joyxsVl0Rlf+lF4HxnFObZHxJaiwvlwRVzlzVVegEPjd+TIhAP5XJuGq/YQ
 scrsUQszG4AJLzWX1NHuHRpVyM/k6O+VK5GVc678QE4tdZ7WDLO8TwK2Cbp1QgHPAEgK7TnZQY3
 Qmjr0WqUebg3xz5QGichy3uvc262w1Vs/YDSQNSAYnTtr64CjIvZAQ/rBrFwUH4KcFjaCHFkou2
 RDK8zcRgerVgoPzmR1kzxjzvtyJ+UAA7ThQlq3LXZfVeIblfMp3bpODGKENU1TEb//5G/LSGMfF
 60P58oYGpzR+7IxGrzMyPZm1U4qUfuowq8w==
X-Received: by 2002:a05:620a:ac14:b0:937:27fb:96f8 with SMTP id
 af79cd13be357-9398048b0e8mr448268585a.41.1788518988500; 
 Fri, 04 Sep 2026 03:49:48 -0700 (PDT)
X-Received: by 2002:a05:620a:ac14:b0:937:27fb:96f8 with SMTP id
 af79cd13be357-9398048b0e8mr448264785a.41.1788518988052; 
 Fri, 04 Sep 2026 03:49:48 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6023edsm144861465e9.7.2026.09.04.03.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:49:47 -0700 (PDT)
Message-ID: <63b6c4c9-9ecf-4761-88d9-fbf76f761cf4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] hw/riscv: Socify Atlantis
Content-Language: en-US
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, "mpe@kernel.org" <mpe@kernel.org>,
 "portias@oss.tenstorrent.com" <portias@oss.tenstorrent.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "clg@kaod.org" <clg@kaod.org>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>,
 "asrinivasan@oss.tenstorrent.com" <asrinivasan@oss.tenstorrent.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <20260903055131.257903-1-joel@jms.id.au>
 <5ae005b5968e375e341c7bcbc076c78f2d2bd426.camel@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <5ae005b5968e375e341c7bcbc076c78f2d2bd426.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EyAB0sNWbFJNYwqssfNgDCSCKq_tWHIC
X-Proofpoint-ORIG-GUID: EyAB0sNWbFJNYwqssfNgDCSCKq_tWHIC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NyBTYWx0ZWRfXyY3rhAuauFQO
 gqt7rteBcF5HeWSivvX1CNwBQvpmjzDBCkKybC7l1KL8fLvI9XIAHyELgG6Iw3VrBxvBOewa7OJ
 PCwWEOJ58uHpE4uLhw+0xvGoIenfgaE=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9aa24f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8C0MhvPsAUCMf7Mh04IA:9 a=QEXdDO2ut3YA:10
 a=VxAk22fqlfwA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NyBTYWx0ZWRfX8UrIwJfvQmBY
 fNrmptwSW156pvBE2xwvFsRZfaPRVBJviJYr1mwjacQm3V8FIKZvyv4FOU9dMMabsc4nkonIbi/
 AZI7KDvtWwgOBm4d2fETnIlf8nSaGyvo6g0yXjc1uJyUKdmLey9xbsA12phyBYhgiVvbS7KQk90
 IbkJdMAvDBXh5QRo0xInA3fITyTxcr9de3NzSDVdc49kGPC9s+pJlUqfVbvQW6m7hoHfvgWPMmN
 zx1pKVh4Jn7Aq2kJ4bwEwCzvgH1O4q6f83JvoI3LhJERcOiQpjJ9Eu+Jnjf8S3F7i1AXnc4PbR4
 wEgvFwtqGzQ1xfRe0VA3U3I3LE44uZLyZWf9T+lrcwXmp61rEYrcTNOjM6Yc5pEGce7Uqq7JVjD
 /FgKubinzOwFN5RWcl0dpTSA0bsIrVKPdKZJnC8jjZBu2cFkNpqBWrWCfvyRVOwG3fwNfXECq5s
 pA5Cexo24umf/1vDX0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040097
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

On 4/9/26 01:35, Alistair Francis wrote:

> Applied to riscv-to-apply.next

Great! I made a comment on patch #14 which can be addressed later:
https://lore.kernel.org/qemu-devel/a4b3c4a2-e359-4952-8b1a-34db4e2b3c9a@oss.qualcomm.com/

