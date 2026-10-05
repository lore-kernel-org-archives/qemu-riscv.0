Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C19CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 04:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDaJr-0002Dv-TV; Mon, 05 Oct 2026 00:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDaJd-0002CI-RO
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:28:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDaJb-0005g7-SR
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:28:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695102KN3242295
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 04:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zSMX2wvf4RQtg960YPrfeShaaNNNLiY9P8LqaACWJT8=; b=KM9W7JErf2EUhQvt
 bmrlQqZbh7CgR5rMluVU5oPB8pma4MLPXu4cuKcKJt/eksgXzQil7/H8zExKqfpK
 AlA5D+4L4VF15nC85xk6Aj6NV6f/qrQfSg4Ja9urgCh4AkqlEg6YWK/aj+i1AS5Y
 arsNSEFdBcqqu/2IkW+MmQFxiAwLESEUFZ7E9wyNBSwGbgFRLddSN9p32/Dh9lib
 hgQvNolRLkEBsskaKe1cIFZKqvTmTkiksf+RUdpblXq37eYvRbq8Iz7Co8/0jICS
 gksG3W3BHnWuAz3xHK+uL8nd1d7qNw3xe8JITfktBeZhaBZlbGlTv2Gt7JeFFwDm
 r89FKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvev9m7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 04:28:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917a7fffbe0so35619786d6.1
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2026 21:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791174511; x=1791779311; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zSMX2wvf4RQtg960YPrfeShaaNNNLiY9P8LqaACWJT8=;
 b=W/x7tBNAiYUxAUuGYbKFtFIiji0SSoPjtj9folZx1KcwFkH5WrOnTMk7ZC6eEBGWGr
 nf6f4kqcdh6PBX0bTG1L6lAH1YPhsoYFi4ZOQYxm0PyEucVWeqIjqwiIllBZ/8kXRSAo
 fhOxsU8PY/csPiWHPcNy6uVDfCY+eQnTJuDSotLkuw7epzdstne1oLrc4voeMOnstQPk
 Vg8whDEhKPQASL4N8yYAmT+bBKSqsbx4m2GYoj+uRhD8mjDBRE0GGrMXPmB1+mAoSEWg
 /X5aItog98CPmUn1hJo/Fv+uyW6L7FjZzXHtqCxr88pPxbneM7vtDVn7CMFG6o8u/ygB
 35MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791174511; x=1791779311;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zSMX2wvf4RQtg960YPrfeShaaNNNLiY9P8LqaACWJT8=;
 b=YtDSz1n4e0MHDLhF/AMSc+HbxO2yOVSB9NhKJshMkSP90SQteaM/Pu1vP1V2vzadmV
 6eOm4kqFVqtyALAplglmVrBHwP56aRJoAP830jm3SG7iu49UKFz5+hMEp28L/vW8kvKb
 7G1/frWHMlxg7nIOm9otBfZUUnczLVIfw3LY3f55j9CPk/aYvE0P+ka/Ja3tcAHDr1NL
 LWOoYmkQxJjppmmY2jIfUZfaO4bIGf8AaUX2O/uIi3FW+gTjy66bNNWzdHKcXFWdtUGu
 7DBSgKKZC85TibLsmpK9agdymYfvs9R4UOIIT5OoGquL4dH47svftWg/CDnneeP8bzug
 kj/w==
X-Gm-Message-State: AFuF++mSiyMgNdDyl84iDbbdNMMqITtSmX6u0zfiMsuVxoZ3fv++cff4
 2K3AbYjsysmNS3p6oaONow7yayYqVNjXR0T7hJ1GIqNsRRkSqyYS8WJSajO4oL9UtwoP0pknIr9
 Iob4sTqntSJRDz90g0+cX6/dMVGG7/zZnynjgHV/rxC0yaGY9QNpp/lOSZQ==
X-Gm-Gg: AYBFou2s9aPsiHINvnh3TZD7D6afe/MPG6VocRlyK1MrXyECFcO2yzAtk7/vfTJ+pYg
 LQNAEy9+Fjui32TpETQC7+v/INzXeb9o2AkKX+yWrc6ceBqdjqO9tfc4WXIIOykdFbsCjLugpcz
 4cRIJwJV53IiULQ0BaUA/O42JytpXtioFBvJmFwHzpepcNSuxb6captfagGXE44o0hF2o7uHYAw
 9ewgd8qTXzcfBAUJpDIQG/f/1izWEIy9i11NCBY3cD4ipV7gICuIc778QsHmYJch3nWB2+Ps3Gj
 vSAVVD4vH8IXqlIv/NlkAaFyneDYNV8MUBlrfnt4txFprhEqMljzM04e3riCgdOAwwkJ1JIE6TO
 MbGAcRMd/cWGirdVkwHcW41FFGK1TQCcTAiPq
X-Received: by 2002:a05:6214:250b:b0:914:563a:b3eb with SMTP id
 6a1803df08f44-917c0166b16mr193004636d6.40.1791174510967; 
 Sun, 04 Oct 2026 21:28:30 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:914:563a:b3eb with SMTP id
 6a1803df08f44-917c0166b16mr193004336d6.40.1791174510479; 
 Sun, 04 Oct 2026 21:28:30 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-919442ce1c4sm70842716d6.3.2026.10.04.21.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2026 21:28:29 -0700 (PDT)
Message-ID: <eeb97c7e-e4a1-4b8c-acba-74025b22f1c2@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 01:28:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu: fix entry leak with ioatc-limit=0
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-stable@nongnu.org
References: <20261004151855.201300-1-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261004151855.201300-1-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 84oZiAuxaeKuh7aEns_oJVgB6H6NfY1R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxNyBTYWx0ZWRfX1Ydr1Hfdr4cR
 sWsXyS0hFf7v1kAnIcayTrNZNU+C01aQ7ydNdubpibKonYp1hkvygFE51q4vXCmGrlTeXV03WfF
 LfCe1FvnHQjSucjXdRZeDpHTFp68qK0=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac32773 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=69wJf7TsAAAA:8 a=O8oy15Apc-w8djsST1MA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxNyBTYWx0ZWRfXyckCTBKF4dec
 YgeNZqRpZhtdYLUIxwIvuXvXFIuP+CE4ILXydUGddrp3RMI8Ras9pZzYKeUD05SFXzCjb5m/1dd
 Raf7hFmTCcZyBl0p/8tb4AUhJ7AK2izLSiS68zZvix4sfhCM9baokprSzLcFMUbukGqUe3vQWH9
 gQvSgw/AlEJ9R2lqWp+y94i8sSW3NcoD4zyEXBqsmR6kNBKgy0e0FGJ3A9N2tEEWm0MSTS9pOqW
 J9QS4wkZhW9F8eE45jv5Dn4wJpIM/McJ0RFOz5LpQgfWyr6SlKgbLJEQjZlUHXTJj5Ek0xdhLDD
 UEBI1PU1mA5RJVOG7xcya9/2CXZUHehM7rs46cLc+oXd0WMZ47OMFO2G9t78myV5BPe8BEyukXE
 wA9gFdXEIEdcqRiHQGl29ZPBWi9Iit8ORsAy5pAViazdrUb1D/WtVoD1qSGiblXINsx59qaeRIO
 O3eMRmTctzHezbSHZLw==
X-Proofpoint-GUID: 84oZiAuxaeKuh7aEns_oJVgB6H6NfY1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050017
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 10/4/2026 12:18 PM, Tan Chi wrote:
> riscv_iommu_translate() allocates an IOATC entry before passing it to
> riscv_iommu_iot_update(). The update helper normally transfers ownership
> to the hash table.
> 
> When ioatc-limit is zero, however, the helper returns without inserting or
> freeing the entry. Every cacheable non-identity translation therefore leaks
> one RISCVIOMMUEntry.
> 
> Free the entry on the disabled-cache path so that
> riscv_iommu_iot_update() consistently consumes the entry passed to it.
> 
> Fixes: 9d085a1c3cb2 ("hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---
>   hw/riscv/riscv-iommu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 323a041b4a..ebf8d7006c 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1700,6 +1700,7 @@ static void riscv_iommu_iot_update(RISCVIOMMUState *s,
>       GHashTable *iot_cache, RISCVIOMMUEntry *iot)
>   {
>       if (!s->iot_limit) {
> +        g_free(iot);
>           return;
>       }

It is better if we could avoid g_freeing() stuff from other functions to avoid
cases where we need to fix freeing logic for a certain pointer all over the code.


I see that riscv_iommu_iot_update() is being gated by these checks in riscv_iommu_translate():

     if (!fault && iotlb->translated_addr != iotlb->iova && enable_cache) {


The 'enable_cache' flag is a flag set by callers of riscv_iommu_translate() in two
instances:

- in riscv_iommu_process_dbg(), always set to 'false':

    int fault = riscv_iommu_translate(s, ctx, &iotlb, false);

- in riscv_iommu_memory_region_translate(), always set to 'true':

    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb, true)) {

The use in riscv_iommu_process_dbg() is correct because we don't cache
debug messages.  But the other one isn't - s->iot_limit is a property set
during init(), i.e. it won't change during the iommu lifecycle, and we
can't have cache if s->iot_limit is 0.

So I think we can do this instead:

-    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb, true)) {
+    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb,
+                                     s->iot_limit > 0 ? true : false)) {

And we're fixing the leak you're detected while also making the logic more sound,
if ever so slightly.



In fact I think there's more improvements to be made w.r.t s->iot_limit, i.e.
if it's a known zero why bother allocating s->iot_cache in the first place,
but that's something out of the scope for this patch.


Thanks,
Daniel




>   


