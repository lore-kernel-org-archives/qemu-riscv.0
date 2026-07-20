Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE6AC44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wli0M-000197-BN; Mon, 20 Jul 2026 03:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wli0G-00018B-Fx
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 03:01:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wli0D-0000CO-IS
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 03:01:27 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RVOI1762334
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FALdyOvXzP70GeuDjWxy2vT/
 fhKw4YxzpYENnZXo9t0=; b=gBCGihWvHFd1hcmeMfOB2adBMh2dzFNQEACfQB12
 Iby0lkeAYKlVYsOHyn/ab45/GLdcVWsFqb++d5y/A0WhFqYWGlhyHoRl0XnUMzid
 agQ8iDg0K4jM66u2NfYRIqXfjPSJv01CrwXNxYykQfm5+UxhSAODuWK7TwxXQRcf
 /4vdYpFIqbpt0IEltdmidDPFN6fslDdMQhU3pqrZXshcdKO4FtccZUEDUoGNPxp0
 u+BGYVJq+q6oB/ooH/y4vyG0YKvyfEtJfmrUoskaNG7SxxZ4Vex18E+I28XRFi/q
 +KCD1+3rNcLYK+FQN2v76OH7bI6y21yw05z3mGMMOAWCQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmv1w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 07:01:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8fdace20927so71959196d6.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784530880; x=1785135680; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FALdyOvXzP70GeuDjWxy2vT/fhKw4YxzpYENnZXo9t0=;
 b=XCvgR0/GqngGCJ4RF9c8QegoISd5gxMhKFj1BSKtmrXM7+aA6LTZUr2QS4gW6t+4Jm
 Kg7kibYu5GZyhzvaDEotbJeQao1pJR4g04FvFQ6tvFfxIWA3Ux7eixjsDgob/tbrUzFu
 whxewwk4ihVhL0M2xgWqBFihSrz54urVtjgGhRijqK03FPX+wszorYyTYf60kQaDwoJi
 9PPehpnlmbBw9El+VkpzDtBIpragacEx1Atzy8cT3e0ZQUrhN9D78fGEqmm297Wf6EII
 D7nCH6m7KXZcDBezxuOeMu1SncXzZaDOp27cBbVo1uzuPeBnDTIiQ6HV7veWCzZZ/8Hp
 Rn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784530880; x=1785135680;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FALdyOvXzP70GeuDjWxy2vT/fhKw4YxzpYENnZXo9t0=;
 b=F5dCVX97T0QkiaVvTHndQFBBv24DQd3bWs3G037l+FnyqjKl9kEQqmYVvCPN3E8ulL
 F3Ufg3kKFn9ROnpP54qJL80UiBcqxTLT9nUUBmA+s9USp2u7yZ6f4FQS+Erc4VYAD3RS
 eZaCTJpKYT0xwEkyBpnM3Ayufb3DBZn8W2wpCr8ee1FVKQB7v1OVzEzoQ9NIBeWKHBUH
 cbxhlPraS9zherUSOMewviey7Uh2ZAHyhNExdPy8LjQXsqtAYRRlYFi7nyNM3duMPWqo
 IWUfpQ6UaC1ynKplcK3JE6yiFNhwt9MLDXCAV/m+FgeqM15J1Dkeg68hBpEOpP55d7a9
 OCpQ==
X-Gm-Message-State: AOJu0Yx9iR85o9kTzPxOlQBcrWz/jFZoQQzLWbpw0PvmP2HY8dVqVjR1
 XE/sbJCHv1R7wo8AWP5GtBTlPHJ9FbbC7hkQApjqkPO4cBgayv0JE13iExNxk26rQzuZqZxyUKg
 UEGDvw1ELjId7LHemPfMP5v4TPNr8FtpTMxZolMiGl8TYg6SoJOksfFMY8EtlOnyGKQ==
X-Gm-Gg: AfdE7clC1MSb4/G7N1FEsCWoRIjXWHBB3qU2OehmxajMrA/XxhcPITf+qDCM86R48ZW
 V/y1Py8jzWsa9O0ZJmmtJeLQ9zCgvC+QIudacZzwszcnjhQmB/EDRDhnIFqw9BvUBC6fnp/Z2Wh
 jNk+XOKFwcpDjd6k32yMfsOySxj8sQ9sB2hhlKB9coYw31QeTYd4bTZMxZfNFWwJTXk2dLKbI3g
 Ik4+xyFsk2tfkcjqO4zLiQdqsYj6qCLSQIx81VpvG1Adpvo4lhysBgrpVTF/Gl/tndiTs3/dXSb
 Lfzu4TgmmLc8wreRFbDYo9JN4Rrzf5VzxwSYfbeiaAJGRkpA1wWEWTUrbcWAbQY+C32woKRk85v
 geSkhDkIebPTNKdj6f9NwfHlP7Do117wgteS4
X-Received: by 2002:ac8:5fd5:0:b0:517:76b7:7b3e with SMTP id
 d75a77b69052e-5213cdcce1bmr113574171cf.38.1784530880318; 
 Mon, 20 Jul 2026 00:01:20 -0700 (PDT)
X-Received: by 2002:ac8:5fd5:0:b0:517:76b7:7b3e with SMTP id
 d75a77b69052e-5213cdcce1bmr113573831cf.38.1784530879826; 
 Mon, 20 Jul 2026 00:01:19 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1712a63d99sm417208266b.41.2026.07.20.00.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 00:01:16 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:01:12 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com,
 daniel.barboza@oss.qualcomm.com
Subject: Re: [PATCH] hw/riscv/riscv-iommu: preserve requested perm in
 spa_fetch()
Message-ID: <blo4r5n35wddu3lf3eifkbuk5n7s4kfqd75vzea65j274hxj2u@j6vt7whhvhza>
References: <20260717144525.1154204-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717144525.1154204-1-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3NiBTYWx0ZWRfX8yFfAw860y+U
 7RtZ1ELGf4hiWzQS2uqLPWGz5cqjqmPiEsb7wtCC7/JU7y/1MqAIcm5sJQWHcQLMUzL6B60/R9c
 0YyVvFRhsLIQZbqxt6H8QaiTWYPkPyD3BGdPa10nDde3MUWkwLnOf3xgmwlK4WIZFFoJkbERbm1
 7E0b7MGK8EoGdb0LbLN+nUBqkLKZVBNyB23BEiglTDSLbL3AIQI6coXV3YGNHUNLHK8nOh8sGgo
 L76rLZgx5TU3xdZ6vQrcqdu0gE8hmrcaAcxa8iTA/Zw4eBFNnIEtG4aIRP/dsx5G8O0kqAcTwwF
 Lg2maPCdl2rQji3nGnlCzqOUIHD6m/c+1e6AgLCjL68UdzYGHDWLXm4601bvlPOWpC9DxNgbyVA
 JCDGW8YAhx/Kd7Kp9A7DVzz2VSYMgVv4uhjA2pBeEmjfisAxk7XduJoZDGYqM0/+b+I0Flmv9rT
 xX9S71CSYq8pBuEB0bQ==
X-Proofpoint-ORIG-GUID: DJ5-wp6IQPeMsp210QBBqHXVb64m24Rg
X-Proofpoint-GUID: DJ5-wp6IQPeMsp210QBBqHXVb64m24Rg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3NiBTYWx0ZWRfX5piGIXkJBo4G
 w6tajfviw364HCESOG/LoB5O4ac+hyuXZfEL37/q3sFXk4VXRrFYn3ZV7X7ghvICwSEfu5CaVjK
 bKwrD6irjTvCLzYSn5L4h6yqjWxdIRs=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5dc7c1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pBlKQAIQ7nZEyNdry6oA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On Fri, Jul 17, 2026 at 04:45:25PM +0200, Andrew Jones wrote:
> b18e3f0e2d0f fixed spa_fetch() faults whose TTYP used the leaf PTE
> permission instead of the original request permission.  However, it kept
> that request-narrowed value in iotlb->perm after a successful walk, and
> riscv_iommu_translate() caches iotlb->perm for later accesses to the same
> IOVA.
> 
> That means a write to an RW mapping can cache the entry as write-only.
> A later read then hits the cache and faults even though the mapping allows
> it, which showed up in NVMe testing as bogus completions and controller
> timeouts.
> 
> Keep the requested permission in a separate req_perm and use it for all
> permission checks and fault-type decisions.  Accumulate the leaf
> permissions separately and copy them to iotlb->perm only after the full
> walk succeeds, so cached entries describe the mapping rather than the
> current request.  Since faults leave iotlb->perm as the original request,
> the S-stage and G-stage TTYP fixes remain intact.
> 
> Fixes: b18e3f0e2d0f ("hw/riscv/riscv-iommu.c: fix fault type for spa_fetch() faults")
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  hw/riscv/riscv-iommu.c | 50 ++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
>

Based-on: 20260717112340.1071148-1-andrew.jones@oss.qualcomm.com

Thanks,
drew

