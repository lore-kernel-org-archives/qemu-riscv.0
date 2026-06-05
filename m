Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42754CD6E7D
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 14:56:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVVyX-0001dL-MJ; Fri, 05 Jun 2026 10:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVVyS-0001YP-0o
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 10:56:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVVyP-0005EQ-JG
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 10:56:39 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6558Yq2Y3603436
 for <qemu-riscv@nongnu.org>; Fri, 5 Jun 2026 14:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Awk0guH+q22F5WryDeG/aUkA
 CmMIND7ulZIvXaW91j4=; b=gtsxiw2koaQ5wZc+1G1CDr8pzqruhhWEy7dVv0Ea
 5r/K51oDXY67RDS6iCBnNqruJDVhtoRR4sSph5lGQd847TNkkyRdV/HfylrdhUp5
 8WLzstVdHV8rky+yhV/hH0BCEus6PtkvdC+m+1fUVJ2gIS4xq9atm5e4oUb+akVN
 wZ0/aQzJXNbHrehDCgetTL0WqqKqbpePhnjWBeZCafB41z/AB0MnLLJ3HtyQm0QM
 0nKI5nHSltH8c0T3zU4cqG/la2MtGqZiiTuy0YagVOO0c4KXGm3JyQVvlBpWXOG/
 RA4GSQxLZJaVbQQnVO2MZeMU00Y87l063hMrUgOHnEjvRA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfb05t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 14:56:35 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7e6691e48b7so3027915a34.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780671394; x=1781276194; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Awk0guH+q22F5WryDeG/aUkACmMIND7ulZIvXaW91j4=;
 b=YAq4BjNcRZVWZAJK6CcFKBQPG74by1qcOBok5VvnjcXoAYoX1jbocnfPSKGdQS8VZs
 Yk3Y6jis9gqVEujpxQCsL8E5gBm+JA+hjVIZzDuOWrYrrHtdWukZ5QGOF+ZbRmrhHiXw
 2kCrZc3OmBVA1EBSDXJoD3UeG9Y+dWggPy+8qhhA+idhkaa4nb45hHMMpN3+xTgQe31l
 c279WLTC1vvkLVQ4O2/ykWjcry/YCCdYBH28qYZeAA9CdbDWFOjzXLFFlC8OBkBFC+aR
 ifvVoSXeelP+BLxEm2gpLE4yEwVsNxn/pR2YaH+i1oqUbz4u2/61w7RQqaHuDggonWuy
 84jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780671394; x=1781276194;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Awk0guH+q22F5WryDeG/aUkACmMIND7ulZIvXaW91j4=;
 b=aAflSG/1DTKnmag0EAnkKBFQYA8h2FvBbqbx0N3eNuQ4WTxgMS1OsduMOvQf32Kfxu
 9ROaG4EJVHlNC6A49BDnVrJDDJlzKiQlJLWdyHn/QuxqlPoSD/gGLUP1foBgyHQCgYjQ
 yMaF0gFk6ccTIqHE2LX5CDNG+tpUnySaTihdBAZM5Uio3eZvkFDQ7iYqivEpT8pr36Oc
 ZhqYQzcR0bQgc+MMk3aDtPvVcswRAhG400BPlf3oSWXCmzOjBt+eYbFhxuPONq2ZQfaa
 qi48XFvNIgD1tspCJ9eJBG9IDu+UO6sZMp5luyj1vTuSavFH123nngrVcqvputI78ieg
 hJxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qE4UJ4WCd37Fr9rXhUK9ptU5456dtaElG5rtZ/OX6UqKOaOmde1blGt+x8Zr0RkhYLH8b/w8Bb3h4@nongnu.org
X-Gm-Message-State: AOJu0Yzv0ffMC9Cn5WBbN2fY2cQ+4NajcssmuYOeXQCT0S5pX8WPCQhi
 gm4+uyMLJehwu8At+wXoqE+Vx46XbvNNhk7rZjrF92U8GDOx+rkbYcSlgZiDqy2KEOkcu/p/Scy
 q/wzEB3wizVRievLued42Pld/BHMmFFQwk4N4wPRsf0b19Z/zRhXUCplOjg==
X-Gm-Gg: Acq92OFO++lZSV6uclrWPIeUfz1xOwhTRmp+k8w7K0gZWmLJvpijVeINHJtlWsAdJSv
 zQN/CV5QTDj/WeL5hfvftI6YkkPI+GyDPiGzfNS6YLkE1vVhj1MXrxGXZgNdNo7+OZGiEB65HLv
 xm0EcwLODR+JPVFw6et64p6cfuLwtmXS+zAMBPITO86ahnb75CyQxOVNyBC7p0taoBot3KvrJmc
 pzaa64Qy+z8ran/iRKl+ClqM9zalpOMzUq/YJcgFROdjFvY0nURYnsQPspMYx55gVQYViE0G0BO
 ONRiKG/8cL2Tl8xIS8c+r236OtN+L2uGRHcLWWOGa4cFUXs2eWD9qMnxSMoCOQ1lvXzUtqs0hqT
 IxJ0WyvExiuZcfA/fIwTeBlodbNO0UelcNjJVJsyIVw==
X-Received: by 2002:a05:6830:67f7:b0:7e6:eb9c:3781 with SMTP id
 46e09a7af769-7e70c7c99d1mr2415292a34.12.1780671394566; 
 Fri, 05 Jun 2026 07:56:34 -0700 (PDT)
X-Received: by 2002:a05:6830:67f7:b0:7e6:eb9c:3781 with SMTP id
 46e09a7af769-7e70c7c99d1mr2415279a34.12.1780671394189; 
 Fri, 05 Jun 2026 07:56:34 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e797cc76sm6176414a34.26.2026.06.05.07.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:56:33 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:56:33 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 leif.lindholm@oss.qualcomm.com, Fei Wu <wu.fei9@sanechips.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
Message-ID: <geyutotrgv5zfrsit6bqyet5jf43qnwszqk4v5dnnkhhngqmh7@au5jtky6xi5r>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
 <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE0NiBTYWx0ZWRfX1673Ye4IAE2F
 e3fM+gvKu28d3XFuWHYnXq6KwokSojyou8OtmVRSJErC+bc06PsBdcqVeiFyJluQDzprTS1YrKA
 5E1XhUX7uEZxcAj3U0n1LkhZr0BhQCdVuV3UuEWpeRZrxAz//w6RxnoVpC5kUBCIQelkFvR50+T
 FjiFObDyeArln+sCWznMKkQz+yo7HeYxLkMa5DjDMftIzoFOiT06ZyElkkZeExl66Y5qXbc+oXN
 v0iORdeLcCqvwMPYIdKvzMzXyOv/j1U7DnU1vHHNqfLaS57BYfO3dwyPzkPHs9f/bF5u+8agBwm
 YFpogrCmQsjke/jydBEmTpddtYs82xQf6YNO4os5MKpdXrpwpkdhAFQnnQpD5k+GDndiA/YoH60
 +GtEjD4iRtZ1j+Ur7zGpbbu5ctkqtEMH69ulxYGvJ/ml9tRK3xmr8fvYEAZreoVn8DbiTQfRfAC
 RGCZKtfCcbqGRcvk6sg==
X-Proofpoint-ORIG-GUID: 2yd_A4r6J5gbHq15eeHS2kqKaPrq420w
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a22e3a3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Aqq6rb4BZiic6_Hq00EA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 2yd_A4r6J5gbHq15eeHS2kqKaPrq420w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050146
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

On Fri, Jun 05, 2026 at 09:28:39AM -0300, Daniel Henrique Barboza wrote:
...
> Thanks for reporting this.  There might be extra stuff to do in the code
> base before adding this CPU (maybe adding a 'satp_mode' attribute and
> make CPUs default to that value, like profile CPUs do).

Indeed. Good catch. We want to enforce a minimum of sv48, but also allow
optionally wider widths. I think the current default to sv39 is fine for
the virt model, or maybe it should default to the minimum that supports
the rest of the machine parameters, but the server platform reference
needs to enforce a strict minimum and support for that would be a nice
feature for the virt model too.

Thanks,
drew

