Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1327CC79FA0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:12:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3rs1-00072d-0e; Tue, 08 Sep 2026 05:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x3rry-00072L-1d
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 05:11:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x3rru-0003FM-RH
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 05:11:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6886LoU71646044
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 09:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QC6qhvdU3pT7y10dLqA7CiXf
 l7RYcOBKBN5mbZS7txk=; b=UoqmlDPXBGKXxrOhhb4gOj3F3UbNFINMVKD9kNCU
 TlnBXBqhWrDrs6XNfH4o7HcjZzHFaZHVOLqffuNXY7yDYVfG6aqhlCbvaj3EF69r
 axjFWd8YkXcPWtFkvpm+rqREzZ7Wq+OFKXKpF1WXPgYXOAi5V7qNWZgxGFh7omVE
 mQfWtldu1We3TbnqvU9N/ZPLdImFuUBuiquStBRypYcUvfVjq6nDAT3ciGgJd/nB
 3QU7jcniuJ89csm46O3TUpakY5LE9Sa+JOBAEVJBAwnvS+VruZ1ZF+gJ5YVuZqGK
 53WdQKDgUUpEOV+BphVcuFTp4/8jVMKANagHJNkXUUX8iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugqq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 09:11:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93915f50a5cso1054793585a.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 02:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788858712; x=1789463512; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QC6qhvdU3pT7y10dLqA7CiXfl7RYcOBKBN5mbZS7txk=;
 b=MRRMlhZ6MslQ+UkX3PuuSEu1alJDA7vSFx+wOBoHYwBgq/ZRqnS5nVdqPyB6Uk0+NH
 7d5ArZh8mQyQqDjE1Z6rMG7oDl1y7RbFJdEbcrRfjBUooNuoI3jB31eWe3XlqQUOj7hU
 PnIMy7VSDrNqGMEzYfC6zK0xrETBjSPG+SpqsSXwAmhB/SyhKRixU0GyGK4SHBXAAwx8
 uBocrYMap5lLh6VFoMecN4b7d/ZFdliuMRiKY0oCrFUnB8dbIc9IyHMRxqirAsnT+Pi2
 n+U4MZLm1Y3wdkTDFfxUQPFnL100dIjKF9XdZPZamyR/0vBsiVFMNEqSmFe2DZEBjPBx
 ALaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788858712; x=1789463512;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QC6qhvdU3pT7y10dLqA7CiXfl7RYcOBKBN5mbZS7txk=;
 b=K4iY22Y+O2XEuf1Rs7l46boDzcY66XmqD9pD0lKgdY/5UBfmnBI0srdrrfV5TIxhLV
 kyYLHGzvQihgxhm8I96rXPbGm+ks76ZFkUYtY8XsYTqLh5ezNe7OXGy+RQv4D/zqBEdw
 S0NQaM6dDfBmzXEbEpcMOYq7zxfcYYyhCnaLp4hppWctEur6BdlOLCRvllJhOVCcdm0+
 UXR2o2tTBfN8ObmvjbsJWlO63efnH87lkHgqVC8Ob240AT87SWLSj8yofnyvnsNizdf1
 X5kqMLvuy12ib2Dz43e8LN0a8Y2joABHeKZXy9L+BbiORe0CJ6C0541QK8/DT/BdNxJO
 Wrpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjA8P7ZobaS9Tl948ynM5jEqQS/8HsUpi++swSrM9fZMCYraUQWscXE/Z3tWKayPUfaMIR/ocfoZ26@nongnu.org
X-Gm-Message-State: AFuF++nl4Kq97n5S0sqM1JsknjK0njCb6MqR5HHzRHkUvmwlBmUcFsGp
 MWc/+feucR2eWiDuUe3kCOL0uukqpgIoyWZc0SLfSoroax37CKeJqJOeUssyHH2NP/gB95x92UK
 hY1pJl8pU+C9tJyqQVUhi1q3r8ecvFdSQKe24NXVKIND1jcbn6105XjWBrfXZ5BNaqA==
X-Gm-Gg: AYBFou07fUqLGSmWsxR53k3NPks8YHid8qPycGrmaP3l4y+IM6HysuTubERf/l8+vAi
 54Pgaxj+wvRXYcz9GRt0qCWY8DLAjeZYrYr61Ib5Byj4USIQ0oL0PzJw2dekcX7Kho00gM2gmGo
 arbX6O3Yf5WEu0bgrSzG/2V7vREwGqUOT0NCl8EjW1CxHPtDE/pCAZSFYQzJKB9/8jeMP1/SdqM
 +D5BEC62tiXjGT5EAhH4tVzSPbHXI7ukhBTluZG4Utns6Z5O0+AHWvU0/3fIo+85onwE19m+ma8
 irl3MxplfAJZ3SDcacHFEoBl94ML7HqJC3BHTKkAhRxv2kE7kMWerFX5JYluer66ONJkOPx6XK4
 KEX8pIxZKixr5ZJ/+a5boSnX1lCHoac+YvDrT6Q==
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id
 af79cd13be357-9396e0e1302mr3016417985a.21.1788858711965; 
 Tue, 08 Sep 2026 02:11:51 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id
 af79cd13be357-9396e0e1302mr3016414585a.21.1788858711533; 
 Tue, 08 Sep 2026 02:11:51 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5cfaa2sm580226866b.59.2026.09.08.02.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 02:11:50 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:11:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v10 4/5] tests/functional/riscv64: add riscv-server-ref
 tests
Message-ID: <5pcda5mlbnlftgqemlix5sudyutlje7l66rmy7wjsvzmkrbju5@zsofeqrhmnos>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-5-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904195610.964829-5-daniel.barboza@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fd158 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WguLxQ3cqw7mU-68o14A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Hl78lI-eRjnRQqhNQWV-emGXvDJwHIwV
X-Proofpoint-ORIG-GUID: Hl78lI-eRjnRQqhNQWV-emGXvDJwHIwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5NiBTYWx0ZWRfX2ERHuxV3k8fX
 UOUK0nT8YccBkjZFFaFa3gu8rI4ZgVci89kg8Kml3VbdBs+nFubm5MnMQmOGHjiS9buXpRcj4h8
 ez5hwNh2N2QzcVMdWjlsPwKZA7hRIqIOOyL3VwkgKM/+scE5G2GqXKS1Cnb6+f8rn6mlgi4n2iz
 qGUUEP55OfBv2NZs+MmpKOIn9YceOB5XkD2VUNsdb1g/Tpgj/dJyLgELzDsWkmESevNk7XDj+tG
 /4fA1TLCj0AeEq9bWfzjO2JgGlpxFJYETqFisK/ONS7VpN59Q79txn+1V+ZVN4WjHBN0CNxjzDN
 acy4iC5fOgnKJYimrd+uPTgFWBT7ljgt14LT6lJXfJvFkw7CYuP5CgfrAJ+4Xo1NMYIjwvYZd6M
 fbXVMKQrCvc6tlfVvHFjIZaw+eZJPnkUkO+PfqxRFr3yzX6a78Gwkz5cSwU2bEQKZFEOtpemv4P
 TJbwZpQSqwbjlFTJIZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5NiBTYWx0ZWRfX98J0aK84Nbzd
 pWxtJV/0zmE52My5kA3IX2XJ8x89rbCId36zAXfW6zVK9UFNJuoG1TDHHHC7QkW0Oz6XPoHbNMo
 8fN3vpperNMzzHorG7bPfWNP1JWcWUM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080096
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On Fri, Sep 04, 2026 at 04:56:09PM -0300, Daniel Henrique Barboza wrote:
> Add tests for the recently added riscv-server-ref machine:

This commit uses 'riscv-server-ref' instead of 'rvserver-ref' for the
name.

Thanks,
drew

