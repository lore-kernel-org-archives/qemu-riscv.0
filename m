Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC2CD8C8E
	for <qemu-riscv@archiver.kernel.org>; Sat,  6 Jun 2026 16:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVtaQ-0001yp-Ix; Sat, 06 Jun 2026 12:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVtaL-0001xE-V9
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 12:09:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVtaJ-0002Vx-3O
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 12:09:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 656ExjRn2226804
 for <qemu-riscv@nongnu.org>; Sat, 6 Jun 2026 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WVwFr6iNr3nJbDTOpgOPusav
 iKyW8l75NcPsMN/wwkE=; b=bDEupg5vH22ntHBhK3Vlvp5L1/gopRK6w4fTGiwE
 jbLXv5DUx/2NJVfZjORLrjZZqejoyYUHXAangCAkjd4h7OOLinf2q+hi11Bug5+t
 qi7JEvteb7KV4jKLEKr+HKiwezrdb8CMKG5Vw+k8VwF7S9btC6obvXbt3qmCN1pP
 bLk/6QRqVBn9Mfekt09r/POZZZsmtdB11gV7ZiEStzgPQjE9hS0VYuqrsBp5KOK5
 fdZ/eTQnuFVaX02s0apZYnDBvsj73Ce8FYpJHPjWWBfV/WXb9AQ3i1ILYlWU1mMW
 qNPVnkapCnIy9uY/r2wtDz76lHSQ7ZTcpvg0cMMJyH0ZXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4sw9g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 16:09:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30761ab3483so2875508eec.0
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780762156; x=1781366956; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WVwFr6iNr3nJbDTOpgOPusaviKyW8l75NcPsMN/wwkE=;
 b=G5NAJnVsPOqYDJW9Ipo2mD2f1B27mSZKjt3QYUiLrknEoI5wNq+H0AmowPglTW1xiv
 eYWeCeldu0s3kkmy8lFqIh82Jv0hqwpigo++tF7ZlbU4x0jJLgfnnyL+2IOjLZTm9YXT
 5TUk8V8azM4G3t4VZOZl+2lrLrKs+MzdcacKLNL57ZNNl610zqq62aolTiWuKDEzOUsD
 JFXVimOU0KV9LfK/3JnG6kYuxc5wOQpXk1JoJ76HihsULcqJureyWFtEJ+TBF4GS4r4H
 IcKPZ9rn+PsHIDu5BxFkYJeGW03dV/uYIsg/DT8/1tuwyF0DkoeXEDvLO1Rs27MNw532
 6TCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780762156; x=1781366956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVwFr6iNr3nJbDTOpgOPusaviKyW8l75NcPsMN/wwkE=;
 b=lh3fjCn3e+k+Kd9SW1rrlAyDfseeQHn3u9l8ogKoVgVnoFfWKRFxsP//Oh64CW3sGH
 UWwNFD2Rh+cnN1hD4DxcOTc7WFhpHscd1ZD8PpFNPDJou6mkZduQDhoJDQLnFHGNyJAu
 G20wF5/4DD1uYnRNMc/AJIM68HiH41HbQ6MeWaR9hOqZAwLqfhLIiKmeZiGX1yI41Sq7
 02GshfcgHjGyvg5PWhKb9SiibD4JNNVQ8RIHZgvok5LUZeXKvArtVKPfS0vfdgZCd8x8
 FU74RjcKOA93bXv678JyDCYiPXHsGDCqVUjJb6RYm4dl1jJkYZZVhPcdtejPUITJGNFl
 EUyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JA6Qst/435EWa8eyle6iX5/hZWmZaMs3u4sm1+rFygajb/o5vnDMNpr9FxpgWXSrZdItqREE8hc/4@nongnu.org
X-Gm-Message-State: AOJu0YwF0M6GgR6E7Otsp+txjrYu/fCQKzqejh8Y5JwjM5QJyAHp9HPO
 RppiG6qnry24StCBeQDGP014I2gTB0VZsOZAJSmkHL41hK7ofxOp1C5CKQQRCOid+jU3VuAcXg4
 SmSd7ap8hSJYSeUYI85dgMwsjxbr5WMLqJ7lQbpqFYwTo4Ky4jtLHtKcJFA==
X-Gm-Gg: Acq92OEgRlT7c1sgy5RNLRWswyTJYBNvUV53uqgcWfkYg0UrHEMtCuQ+HmyBlKGMbj6
 Ru9fvUM6pa86hvuLmYHK/jQE10OrtyuFWAllIo1RElj6kDMee/UH4haNhSek4tyc06PfXHkq43U
 1WscAZSHHU8OOwW2dh8y1rv5eL0qT04GxqpvsI0S/X7f1NWVbMw7Pjtbigo23W4C6p7PLfT/qYT
 w2/zOYFDCrJX3h4oyj67S18NZT2aa/4SozNQaEHO+WNabax2+cRIVC8rlL9IgUwxPoEuqIJBtqC
 Yw8cee7kYwRrGEMJ/jZ/x78pbNoA/GJR1BhFCNSOP74iefaH/PHefYdeaN2KXKDEMtE8oReLGLG
 DEnkXWn+MA8Vo6HRFXjCfbSzxDoH+my84gFX8fkYNpw==
X-Received: by 2002:a05:7301:578e:b0:304:e6f8:7ccf with SMTP id
 5a478bee46e88-3077b78118bmr5564848eec.27.1780762156045; 
 Sat, 06 Jun 2026 09:09:16 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:304:e6f8:7ccf with SMTP id
 5a478bee46e88-3077b78118bmr5564784eec.27.1780762154340; 
 Sat, 06 Jun 2026 09:09:14 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074db85f60sm13888759eec.8.2026.06.06.09.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 09:09:13 -0700 (PDT)
Date: Sat, 6 Jun 2026 11:09:11 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 leif.lindholm@oss.qualcomm.com, Fei Wu <wu.fei9@sanechips.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
Message-ID: <skdkxsqs7ag7el6ikasgpdhc6p2g3zdoqexse2fj2mzhmlybmt@2pxvqsl7ho77>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
 <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
 <9b05368c-972a-491e-bddb-7e015100eee2@oss.qualcomm.com>
 <5y2sdlx3pu5oyhrm3yxxkvkwv6pl3bpvuzdpnlqg4xt3l2zrxd@yi4h5x2f2xze>
 <3f9d50fb-304c-4ef3-bd63-9fd215b45965@oss.qualcomm.com>
 <17b395009bef17cc056ae4a58a83c744ebb12798.camel@icenowy.me>
 <eb4169a9-6f28-4104-884a-62249f7ccdbd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4169a9-6f28-4104-884a-62249f7ccdbd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AvdifjzJXycuu053j9QHgmHjCdh5-dDs
X-Proofpoint-GUID: AvdifjzJXycuu053j9QHgmHjCdh5-dDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDE2NiBTYWx0ZWRfXxec7ID2KsxYV
 fex6P0sZH7D/mNgtn6WhoWWJrfkk0VtlezAG54/XyeCyOehEwl0z6QerFPH0X6LMiHGFAhalhLA
 CJYir9+djB3hDqTnEwVlMSmT1j1FYDpLXKGFLFnIte7xOJBJcoHsacrH+TzIAP+02PL3QJNzqf6
 82031xC6HHHVC0f9dhHCWiFojBZu3Gd6eOQUFiCEcrbqYsJ+TOAcoORUtxrm2RueuV+2ZRNPFSx
 DftB8ZJckVIF0W69A7cvKeE9nzX0YZEoxqyZ/+KMPIUGgtLw2ZMQXPQHJPze2S+NR+iI0xxjtBi
 HZueZov2PXqpCZdTgwuCKLMB1iYWyKsIiUIeYH+ku6lSPrgaKOGYbxwBxwHaaJEppo25Dt3Mn7q
 fsThqMr2egyQiv72tYqO+cljlxQnMkRLuAXnYF6VGyUoPi/HU8bYwLBBUUiROFK/E27kHqvRGx0
 FFtWAWzy7hMBYqjoetg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a24462c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iSatDKZ6tTKaIovgxsEA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060166
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

On Sat, Jun 06, 2026 at 07:21:32AM -0300, Daniel Henrique Barboza wrote:
...
> > I think we can just make RVSP a profile, and rvsp-ref CPU a BARE CPU
> > based on that profile; then set the profile's min SATP to Sv48, and the
> > BARE CPU's max SATP to Sv57.
> > 
> > In this case if any other CPU complying to RVSP is added, it can just
> > reuse the profile.
> 
> Having riscv-server-ref being a profile CPU seems compelling indeed ...
> new CPUs could instance it with .profile = &rvserver-ref to have everything
> already sorted out, we would also have a flag to enable the profile for
> existing cpus, e.g. -cpu rv64,rvserver-ref=on.
> 
> Drew, any thoughts?

As long as the concept of 'profile' is internal to QEMU and we comment its
[ab]use explaining why the riscv-server-ref is modeled that way, then that
sounds good to me. If the concept is exposed to users then I fear we'd
confuse things by inventing profiles that don't exist in the profiles
spec.

Thanks,
drew

