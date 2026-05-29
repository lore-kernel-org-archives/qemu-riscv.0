Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC99CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT25j-0007L7-AR; Fri, 29 May 2026 14:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25d-00075w-MP
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25c-0001Tb-1U
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:49 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2HxZ518375
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0ZwropHTkksAm+IeaLomlXgfdTiDpxYD4pyUXh3rILs=; b=BJEt+fOQXXigmyum
 fA0FC3DC+QyLuXpV7/vS3o0iXI2bA0F9mDSMu9gfHk8aRnA0Fw0Fi/LUqV8rGurh
 2RuSFk8z+qfIC6KDO1zLY0b4+mrWIvzpDiEKwNl54agsMybmic7VpIL/vIbvJNXS
 cjW1qobITnmxeCvARgaw1JwnUxe02BxiXyV2DUXA28zDTV5/5yaWDQiD5PKONSkk
 0CE+dGSSZP+nUzPCj3j6jJkDDyBcB+5VMFhTYMt6KMhqyj9qLaQSN1oJkzwSmi/G
 RSyVCawJUt84GLitpT9iZkX6Bvut8QMVn/pemzCzKqqNtcSavJs0qed+7IEB7DFq
 ay/lRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgux8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304e7fc90b1so1363628eec.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079865; x=1780684665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ZwropHTkksAm+IeaLomlXgfdTiDpxYD4pyUXh3rILs=;
 b=K+lmnsflZ5q1kYjTShK+yFnDagG+mz+7bAmlyBExSrk7AmEuSc3IXWBdKGMrDgmUi2
 FD5Zk7dXjlz2gGkvwYqMSgkCYkXAg049sS/WcfSBJ5hG0C3EPqiXEEkgtwXjfO3wOvH+
 ELEYZOOREvxrzYuvVJoPMU+NsIe2gBPLy6hteIfk8HjNJBHTLAqkcQwv6A85P+7DogX4
 vlqaWmCNdhxV2IejguMMzYxbJ1vtL0H6H1fM3+Y5MUBKE95UKdWRd2/dVw8JhsHOtQGU
 0b+rkjGCR18gp0zW281oiIYwda/kXNPCcgwdQTpo6J/8AM3Xpz2TS4H54OD0hadToGlX
 qZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079865; x=1780684665;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ZwropHTkksAm+IeaLomlXgfdTiDpxYD4pyUXh3rILs=;
 b=V5n88awxMk60ayKQLDg4AreYV7Ts1lQ/arfz//lgEldPcUHVpVcbvmfM/PRMV1pZOZ
 Ca5PuSKsOD4mLqYI/wL+dE9osd5QFmgPerb7zS20oKm0NU0CRpHl6WLsCPOtQV8nOGzX
 5LEmKKkilhnSysLeoNhcnurIphOKb4d5qePhd9SdwBccDx+ULre0tJWbeNiJ9k9xS3gB
 2Sznv+q8QHBj3RyNfPf7IoSAkMFh/WxYHRZ7pa3PQrQjxbTpkaznm5xujkFcjPGcIRZN
 bcf0sKJgTIeaIlF+90Jb4Ain5gC7qMjR/1+QV5zKOXr6NFYmNdy7KkC0NRvvbB7F7JDK
 kgew==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MJbYYEuZuAE44mgrsHgn0zFOrZrbMC0HAeYt2L0or3al9Ie+V9XVPXeCfMtLcKomhRXB+xYjqT9Xy@nongnu.org
X-Gm-Message-State: AOJu0Ywgo1N8jFdB6zZrSl+4xo9uPbr5mzqLTObYCGYvAyONfTpywnhl
 N48qZ+ElAl0AltfHpWKjMRLdXHsMxp5hgAw4/fVjddd2VOBNCAmsnUmczpMxg5IELHgSbDEyydu
 bbZTXs01gfAXx0TiIg3MOXW5cEbeLKdDqNy5whA3dxQtLkhLQMyOXWX5t3A==
X-Gm-Gg: Acq92OHHvSQE91zBGn1HB/ZKkDkoBRuzVx0y/OsImWO50GHnIZkyrTSyU+zYGiyY9mF
 bsKdUauXNvPlFrMqmBOVIsaaSmqOLjXgSk8r9GIEYpO10gW0fnyYCvpYwf7R+r+ALeBxT/X71tZ
 OGpwWgme7JHz18vi2rPytqKj+OMKIyIc28xj+1qgcwAaqrjQx9cYF3v8B8DhUnUnBDOAckh3fq9
 IqDzUkY7I5wGUWlkfOCyC2knt++xDKNW3JRez2VJer4phhBwabEn9ogzc78L9JQNUtETw60Klq6
 Kef9OCDA+Av+vyubwRJ4Kg0dH6h/nCLI5pLS5QUhdwQIXrjUp8xA79tNRDKzJUVvOXMQOK+yA7e
 sMpqh9D+5CBq4wdaceytyjAAUCOP/mv9eKshijeC62NDZcsnd021EH+n3m/FGyz1DCZRRSjf4Yg
 AtRNp2x8wIQHbNLvpDBtHjM4Q7
X-Received: by 2002:a05:693c:3b09:b0:2d2:d7b7:5c61 with SMTP id
 5a478bee46e88-304fa4fb79bmr538863eec.14.1780079864957; 
 Fri, 29 May 2026 11:37:44 -0700 (PDT)
X-Received: by 2002:a05:693c:3b09:b0:2d2:d7b7:5c61 with SMTP id
 5a478bee46e88-304fa4fb79bmr538833eec.14.1780079864302; 
 Fri, 29 May 2026 11:37:44 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5b8fbbsm2025089eec.26.2026.05.29.11.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:37:43 -0700 (PDT)
Message-ID: <9e0d9d36-1109-401b-b514-f7011a8ee7bf@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:37:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] accel/tcg: Convert AccelCPUClass -> new
 TCGCPUOps::cpu_instance_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-12-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n2M6S8ZpJyPD2KV-KUg_xpbf9t9rCirr
X-Proofpoint-GUID: n2M6S8ZpJyPD2KV-KUg_xpbf9t9rCirr
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dcfa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5L1J3GIhLrxbTrXAYmYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1PS0+3UnwFh6
 GS11wkYatBIV4SeTQQkxgs0suuyBIduxhURB3s5xFNnA0PVWcE2FUtVvoCxdkPo5jcSAK3fYFdj
 YFfBwvti4WJzPgJYyQvHwHWuryEPohN5gLcoT3QVW7qQ+ClWyBWZlJ5E2oE0nIteoK71488xjFZ
 XdwVrS8i1QM1U5gk5lmXGabNlgNo5DTWYCQsE3nlMRy1dpXvolZ+dqsOZeMYNqVFzr0YG+4fq58
 Px2hXswsaMoRSnFm2SqpDn2eNushCt8PXAbet+oDSYu0Y11lU38GrLFbJcF5IoZsqZf54ffR5/o
 EhTjDxoj9aSLgvfLMiOG3xztBCpLj6e8qhgV2bWhhIrSH5xV9gMTUyEKVzgvf5FRwzE9xQ6oHeO
 g8zUfwHOy9u3rkculQfNhy9Y6oScSt718YdTF5nRboMs361TUZxUT185xmn4h/gQWNxdzy156UI
 ZgkYUOCaAkGxLqZb5dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Introduce a TCGCPUOps::cpu_instance_init hook and call it with
> tcg_cpu_instance_init(). Register tcg_cpu_instance_init() as
> AccelOpsClass::cpu_instance_init.
> 
> At the same time, convert X86 and RISCV AccelCPUClass hooks,
> after forward-declaring each target method (to avoid moving
> code around).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  accel/tcg/tcg-accel-ops.h   | 1 +
>  include/accel/tcg/cpu-ops.h | 1 +
>  accel/tcg/cpu-exec.c        | 9 +++++++++
>  accel/tcg/tcg-accel-ops.c   | 1 +
>  target/i386/tcg/tcg-cpu.c   | 5 +++--
>  target/riscv/tcg/tcg-cpu.c  | 4 +++-
>  6 files changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

