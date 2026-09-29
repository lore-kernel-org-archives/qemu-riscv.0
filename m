Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D7CA5FA5
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBTFo-0003W7-2m; Tue, 29 Sep 2026 04:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1xBTFm-0003Vq-TF
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 04:31:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1xBTFl-0002fL-64
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 04:31:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T7TlxE4097700
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 08:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jll0jYxIyZ1BKNPPmlJOlFka
 kdBQQX0jytHpSKdT3Q8=; b=EpsHStMKph8a/kyNosRXuzchFD6JjPLWOd0vwSzj
 MvyB8GtdV30qv4EV4dmTxH5czO5FxhQFN73S+emuArAKAlqtQRP2MLqDdypDoRE1
 /3E6rYfNHCYRExKg0tvQDf513z+TTZF+OdXbyd7UELIfP/1zc490qUGoUQyWWtHv
 /k6jIccYDGwKAXqudbg3A4CvYzbrb0xLMcEC4T4uYBL8Elc70AjPX2cgHLIh+Abq
 D3YDTNgo8/Pdie0IsC+YIwAqEp2cx/qJdQ1R+zJ6Q6DUJonPWoVZGk4jCUIzJWrx
 5FMparIFuRpxzQtrFaH5H7kQwtcQ2JIozwpgJR+hi8Hamg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1ghj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 08:31:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9308eafb465so1040085185a.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790670714; x=1791275514; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jll0jYxIyZ1BKNPPmlJOlFkakdBQQX0jytHpSKdT3Q8=;
 b=aMdYYUumZSh4/oYBR08+qLgMSTp7HHAqIE4tjhRviUjKvjiq+rHLKANKkU8FE9Zsl/
 +qC1A3aoFzENGV3iwBh7M0TIzP/okB/qE2tcWgUvUlUiG3ziFHrf5fjC8jB95LV4fZeN
 bH2ROxtu9KxZxgYkCXHhXvClYc6WXcwdyVZ9fftokeMSx0AWPO8AU5wOtJSnPWpK7mH/
 9rKJD8UWpiEqYxKD1sGSz5+B/uAs9DJydckmDZ3r5IRfXufy6ggfkCEaYnga0QrqDaDG
 psoNSMdOpOMuuY0NhO41WSZ2uqYzCVkzca8Tz1AtraiufIe446O2njmkLzZ9s5RaGNdl
 v7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790670714; x=1791275514;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jll0jYxIyZ1BKNPPmlJOlFkakdBQQX0jytHpSKdT3Q8=;
 b=TgnAoNYqhRKAc5t+Qig4uCmrp54AjaS6SficiSAjO7tQ69lhNO8gmyJ21kv0kas96n
 mDHnkeuk+x9bk2DTrGMpTxpkLA0TSap7W92dKYL5ixrSEhK3Oorh0Y1v2lEi+R6A9syX
 SaFItGhE8jXhfk+h0sH0icwu1NxuusChZgA9YTJVYNRsm8xGooRosUgqNDAuufHGJ3zm
 dCEPmEXRh5KHkHsvBKqZNdOl95KBSj54hpiERCqoc0ZEKmv2GJJHMhSPXUOAV2NUBoxm
 G2a86X1UwiVIDLVq0sVHXQ2ahaemWZDAQgd71AK8I7NyoP4CN8PZqHMWILKlMg1Q1KkB
 eB4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy40dxJUl0O8RhqBdwejb7QntVviMc/v1zzwUY5jM7DM2DxDT2PFX983SNZ6d1BHfTfg0pj31VSiUXU@nongnu.org
X-Gm-Message-State: AFuF++niEAay3KhtADkWJbZrNaBfDq4CUuax6Q1INu6t7OfgWxje0BxS
 BUP3gb2l4SUwiLVQ5OBXxeS2MvgskWBAglqPfKdflnP8AzDKpTHxZcDQBzb5hK8OgVn1QD/Hv2P
 edDCHNFXhkd4Su6BB8wO139ARup0nqG7ZfYuBhsdIIhsjgxRuriwh3W/gLA==
X-Gm-Gg: AYBFou33XCoGD2Fs/n5Eh/FIq9grb+WlJaVXrFuywP2RpCPMnGpJ1ayx5ISaGRpp16l
 c4KIEXyCKN/eOhHSNBfaSG5u/lJ6SDrsxOZQV3i0BCRGuj9Q3vU86i0y2UO3xdLnv9RyCZ9QqM1
 uAbie8JIm0c47pS1B95VCTpqXKQJ+bYU5TPsR6RCVhiagZMR+ZGmlGGg3Y5yRbE5iibkqlwXeyR
 x5Qsx6n/fbAPBfdFg2HwIfrjycBmiVJYgNE0ZnauPxfi3PRvryim64aVuYzqLIf7W5xktjv1uQO
 p6AlDDPnvjO/npGgBj9NODv/jRbRSmQLnucfsA83xZlHRit1oPkZjMWCHGs1lR352hQjLYIG1MJ
 UtjkdFItd7ofDVDTA/6STnVhoejMdWR7fqeGKsQ==
X-Received: by 2002:a05:620a:6602:b0:939:3a81:326 with SMTP id
 af79cd13be357-93c47498e61mr2179919885a.37.1790670714236; 
 Tue, 29 Sep 2026 01:31:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:3a81:326 with SMTP id
 af79cd13be357-93c47498e61mr2179915885a.37.1790670713705; 
 Tue, 29 Sep 2026 01:31:53 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6acb9036092sm388625a12.26.2026.09.29.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2026 01:31:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:31:52 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Stefan Butz via qemu development <qemu-devel@nongnu.org>,
 qingwei.hu@bytedance.com
Cc: Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Stefan Butz <mail@butz.st>
Subject: Re: [PATCH 0/4] Support KVM on real RISC-V HW
Message-ID: <zqlgon5k7dhqyxilnlyrmxd7brnpftqwabw62rbmc3khxtz77t@pyr4an4sadxv>
References: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX+5l2fFTsdYR6
 gH/Ew9zcbhQHe0srGwAp0xxkOmDid9jJaQbtp9YyAN7DUdppVtUGSah6CTvIUNzV3uq6w+rdl5M
 Z2j2ukIVgSXMfw9m6BkKZSjXUr5Fuec=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb777a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=T7-AkUZC2QL64gVNQlYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfXyLRn2OIZ/98l
 PVDRLepBAZtyO0vhEoBMjp+weyrKTPxgJRhodY7uLDxOOcVVYwdGDahDKIfFZJtf8kAWzQxJ1XT
 3acmT9M9ROKp8SuQx25RLYdpStBQ6OB+ZgvBt9A0tBCwjNF7TPsVNz2V10Zj24zbVift+N3x+Ld
 xruzLZ9CWbj+jiXGCqa80Vz4MpSl5+P4c67KKU+Wddd85cb2w23ZBat1+F9Nz+97mW9ojDtpKRM
 pSk29hiJ3/ROWUmQK9831uQMEAlrg/icNrXmMcrgE3rVfta3xP0z+uys6arVJCECd+TpshetTqG
 ZXU5joes/SkbrcS2k9hMlRycVYdvIilv3IJiARUNTrlPGS5+KQWwQs3fB4wKYv1cwEucbx4pMrj
 qNZu4PTnefAZ7oXnHZF23KddDJCtNoF6iPZEvGqTy/b0wrNIgd0jJw2eBGWjcVwWQ7IIDhOBxD2
 mOrW87YRvIRm4xi3+iQ==
X-Proofpoint-GUID: 8gvYoB1xf0Qw6i2CS6WbbgQYZBzPQt5o
X-Proofpoint-ORIG-GUID: 8gvYoB1xf0Qw6i2CS6WbbgQYZBzPQt5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Mon, Sep 28, 2026 at 08:06:35AM +0200, Stefan Butz via qemu development wrote:
> Spacemit K3 and Tenstorrent Atlantis support only 64 guest interrupt
> identities. QEMU virt machine always requests 255.
> This patchset queries the hw limits from the KVM AIA device to avoid
> requesting more interrupt identities than supported.
> Without this patchet QEMU KVM crashes on those platforms.
> 
> Bug Ticket: https://gitlab.com/qemu-project/qemu/-/work_items/4599
>

Hi Stefan,

Qingwei Hu posted a fix for this too last week. Please work together on
it.

Thanks,
drew

