Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32928C61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 16:33:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzd1b-0002ru-Fx; Thu, 27 Aug 2026 12:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd1Z-0002qN-2z
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 12:32:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd1X-0003sI-4j
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 12:32:20 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RFbtLX297100
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 16:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PpzExICWWXrFjUHddg2HT7F1Pum8dEAU0sEI0oHCL/0=; b=QW/J1MND39Z7jPuZ
 7L5JmwrWsOLRlfIG7pctAjsp3NypqJMgVDvThXdYvSKrO/GnQa1pxlE07axUJ/mQ
 d9vIOR1w0WxQoFfDMpyBEtjCIsJoCaebw4MdYJ+jPt3Nfghx1/odBFs/axTAMudG
 sKgXZen1YqnmL485pQAqEfp0TOrGGaVagw3zilcYgIEEceZba5NwL4h2vexcQ3hD
 ra+1GyiXatYyEckc44rFB9jgyEEieLTB23FW8XYXWA2PY16kPviCO1NAl7NiFjD4
 vZygO457zWJvTNs5jtxeIzuSJKx5ahhKJFyRmwya1ognxVkcOZLmx2W5pDuM+8rk
 JJtmig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fh7g9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 16:32:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38e8fee6af3so150366a91.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787848336; x=1788453136; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PpzExICWWXrFjUHddg2HT7F1Pum8dEAU0sEI0oHCL/0=;
 b=TNWQasZ4zFLznRpOUv2jozSbGByHDIhoyXG49cochl7TqyBDrkwFu+IUy+Mdte21Cq
 UEdpH3BxqORr8QTjZWKBH+C72a5d4RxtbWgR8+MVS0gwpRsweKHGqN+tzxrLLquH8GBi
 fhsPc7Frx5w/QdacIEYMhiMXy0MUijUb4xl6CErShlbzRM+egMXo2hbb58XOu2RCjRqb
 +9JkGqLDKdkYj+Wwe9qp6EMmHIRfwC1X/jfth8lSdlIXMNyNkytWy0waJTFej5XNabWt
 yJ/ndkwefKXwTbA4Wq21EsQbR2fAPWO0H6EcfAg0TgloNr3gkY9I1umaIqHvCjBvZurg
 O95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787848336; x=1788453136;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PpzExICWWXrFjUHddg2HT7F1Pum8dEAU0sEI0oHCL/0=;
 b=cLjUwhVkcMw7IFJyVJDKFZ1PBotwo8Y/n0AKIBoDrc0b/pLvnIa1YkcMZcZxXwsKKg
 cUwizsHYrxlQuHn2LmIZ4bTS/KYm3CLbD+DQVVfd7rLih7NSMwMNT2D5QHUEN0piVF+E
 yfpmdvYYdFOBRyCpl8SS2lU3ZriUgVf0nJwfrp3ldnkPUBQCtvi6P9EEUAs3mkMTLMsZ
 m/2Luk23WNk3yvlnVB9bk03YHInDSbdII7in+qRv0ml/PCIVD1NpTYUJI1r57k1Doj8F
 7Ic14aY4yuT1mtM3H0DknA0R/u/Ytx50HuYsaEFkyGnDI3SHeNYal+1ifAECGE5SrSJk
 vkTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrj653/P/ue0Fl92IQsFiBMsXopCaGSmZ4zXYrKhZG6Q703sjywtGzEba6KVm/p/UWsG5LScwPYjrDY@nongnu.org
X-Gm-Message-State: AFuF++n7g+CE4amqWOT2fZqTxT+MHISwiNy7Eq81EUv0/+Adq4BK4YIi
 5Pmya3LHqaEP9Ympvh3ZttTPfH2BQpwtWzvOZNEUc5jctwVwp/WEdTmB6keuiE3AhnqzcGoFXvc
 ozMTzNUkey+7dDnq4LOVfAIzvKKBb37+XeD62pWBD+rAJc7I1ZQYd/yb/sw==
X-Gm-Gg: AR+sD10Rn2yOfTxwE3eQpgSSA5XMYuB3CLCH1eY9NlWp0GfH/7IkHm0BR90Et4W8jVr
 X+JydpfF+emRdVPGlgKpSh9wIcIyyikzplXVqflEUCkEb/5S/hoDSvHVAEiJYME7MIk+aMLgVSF
 I+VfEx3a/Sq4T0xL447sKmVvvGF7fyGH8poesBbtIFYjhXiGURRcXvmr6hOYh2voEtgFBknPxPl
 zt/d6lKfa4VVQJ3UV8fjZyjVetPVIMgNE7GPnb2A6u/gvQRiPv+DBe19CZOecZ85sbQTMuxmenQ
 9FtRBXtQHHGmjqx2/1aHvzIrLPicBMCPf9j0jJCdhquKRJ57eQwChSn1pWzCjvecBObt8pYHs1q
 Tdb/EzEnvDGEWOg3P0nGpTbU0KfX6UXuTV9xrPzAylmVijURtPg9KR7o3zcS0OH6I2Cqj
X-Received: by 2002:a17:90b:3c08:b0:38e:485c:ebd3 with SMTP id
 98e67ed59e1d1-396d0f9ad1fmr754122a91.15.1787848336219; 
 Thu, 27 Aug 2026 09:32:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:38e:485c:ebd3 with SMTP id
 98e67ed59e1d1-396d0f9ad1fmr753963a91.15.1787848335612; 
 Thu, 27 Aug 2026 09:32:15 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141a9035ff1sm16751413c88.11.2026.08.27.09.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:32:14 -0700 (PDT)
Message-ID: <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
 <apAG8JQTnQxRkfip@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <apAG8JQTnQxRkfip@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzOSBTYWx0ZWRfX8uMA5/5Xba9m
 k8+rJGyR2ujYYlmpXEZI8/IChhZsK0UYJIcAIZkvVi3Zg94ucjo7YQok7Ag5v2gBTm8UKaeL7Ln
 TQUPFIrbRLyZkTa9RVCUVnhV2g6EG9g=
X-Proofpoint-GUID: uVMkX2h5kAPR-qyTn4vNK99IlSZKZlwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzOSBTYWx0ZWRfX0ErMFazOshKh
 AQT1NAlg2XfsFsy5SrbY8hnQ7MoDQ4vJVppOVn3yk0Oo+KufFzA6y2YnWL8o9CrEa957Nqjwlry
 Fgdy6tnT6whXyD5Y/cML/MXfcO/BtVW/0YJUn+iGe1p5yl2UGWA69YAbmwee5SqOBSK9E9iylsg
 m6QtVubByyMCEojesnWdY847N6UiPZ+zZp3J+W7Ci5sn6fRngQ/cDtWYJK99Vhp3sqx+IMwJg3s
 OX1Lx3fw85X59CoSin/IgabzgdI2I0RcGtUIn28f08PaPg4Fez7w2zWF1beQ7g4x8Ct46lHt++2
 Ww2Zp/Hm3SnS6fJzDk6MNY+S1SY1+aD4RR2f04/oW+X8pRlXvo2G6/DTeKL6k3wRgKHZzwUaEm5
 hublJlE9xVv3jWo66nL/01eUtKfwY5PHr9FTYT/nbBtCoSTJ4JsS3lhMvXFPAn7wFaQcSqGbbl1
 HXFWzkhSI7yvQvTASJw==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a906691 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PWUnpSKA2arHrWdFqVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: uVMkX2h5kAPR-qyTn4vNK99IlSZKZlwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270139
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/27/2026 2:44 AM, Daniel P. Berrangé wrote:
> On Wed, Aug 26, 2026 at 11:35:11AM -0700, Pierrick Bouvier wrote:
>> Seems like the Genius.Artist. in the bottle just need to escape, and you
>> can send us a nice series doing all this. Meanwhile, I'll try to find a
>> carpet, a monkey, a princess and a suit to be the next Aladdin.
> 
> This kind of comment is not productive and disrepectful to the time
> reviewers in invest in looking at the proposed patches. Please stop
> this.
>

The only person wasting everyone's time here is YOU.
There is not a single person who came on any thread to say "I agree with
you Daniel", while several posted or commented they were ok with the
approach here.

Project is QEMU, not Daniel's EMU.

Whether or not you like my joke above does not matter, just focus on the
first sentence of it. Send a series implementing your view instead of
long emails "I said so" on other people series. And go back to the lamp
until it's ready.

> With regards,
> Daniel

Regards,
Pierrick

