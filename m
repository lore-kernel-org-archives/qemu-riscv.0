Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUxY7-0000Eo-Kv
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 16:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <etm2131@columbia.edu>)
 id 1lUxXk-00008v-7O
 for qemu-riscv@nongnu.org; Fri, 09 Apr 2021 16:15:59 -0400
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74]:57270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <etm2131@columbia.edu>)
 id 1lUxXT-0000QC-Id
 for qemu-riscv@nongnu.org; Fri, 09 Apr 2021 16:15:47 -0400
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139K86p8015013
 for <qemu-riscv@nongnu.org>; Fri, 9 Apr 2021 16:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version : from
 : date : message-id : subject : to : content-type; s=pps01;
 bh=c34j/JBYfHYrxzL+qkkBrvhZlBIh9t3Vz8fg9HAgFZ4=;
 b=MJoE7ZMUqM0zHWnlfLevtuD4Xx0yxQk49kh4Pxr1CsPX9fU5tPy0rf9UHfwLa2v2NpKo
 hRz9tgFD4FRVRHcCM+92QB+k9O8YOPghY89BSr4R6kiDddFl73Tj+1xWn7c7I8DcXyqV
 ZraOhfMdkYRSpCjZsGMdcxFgFldwelSkT+lf2u/Pyo5NifEmyxUfN82GvuIsjlEF8DJk
 cbWpLyEFtqnPyldoI4xEEQzRQlKz3lKpZi8lquSA+5CdwIzOPXZrFqdEO49l/5tZvx9s
 OZgUa3Au5X7cuK96aM8PMO5Zy+Zdpnaeycu0FdpSYDsp3UwTpdShFO5JTigrtB92a7Mk Ow== 
Received: from sendprdmail20.cc.columbia.edu (sendprdmail20.cc.columbia.edu
 [128.59.72.22])
 by mx0b-00364e01.pphosted.com with ESMTP id 37rw45p7ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 09 Apr 2021 16:15:16 -0400
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by sendprdmail20.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 139KFGns110360
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 9 Apr 2021 16:15:16 -0400
Received: by mail-vs1-f71.google.com with SMTP id l2so231162vst.8
 for <qemu-riscv@nongnu.org>; Fri, 09 Apr 2021 13:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c34j/JBYfHYrxzL+qkkBrvhZlBIh9t3Vz8fg9HAgFZ4=;
 b=l3OidTp3xEC0HFcIagUM1auhvolEf9CypF/MY7BrYMu0EKkMfr4nuAqeIhrlULpu1w
 eIV0XVDpDHC70qfx7HmWywck+Gz/KzdX/M7FZLuGWuxwkF1kP5ONeRiIuuegRgCwSKMU
 AfudOCsYmwm5jf94VdxzvQiknzGXm6C1enEmiAm/hYzzYlEBui2Y+pMpX9kvVvgCw6D2
 cGGcP9oU5S1xyamU0sstu17riaYbtbEdKgjRqcXvD3gfJ3pgSe0lUmkI7rFGVJdvGwCk
 zNElSkk2wWwfs+wVmVMm+vJZ2mXcDZWYt8Aa7CL9yvCeTMcgf+0uC6ujThFh+BBZImRn
 30Kg==
X-Gm-Message-State: AOAM530pv2kZ6FSC1KTFzb05IJYlnfTNAyXaSFjRWiGCWCjQP+O8Ba3X
 1ypmWwLmy+aSrQMCkxB+dcGHbGttKN79NhJyMHoCmeeO62/uZb9cZaDDijxJnuJ5vD3I0J0UT2j
 ENEXiKBeBGBAbJdyDBPpBrbUtyOlFgs4hu3nc2Is=
X-Received: by 2002:ab0:310a:: with SMTP id e10mr12908293ual.93.1617999315495; 
 Fri, 09 Apr 2021 13:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlrze6SywV4Zl6GHjXa9ogVj38UDME147TR6+1puVGBPE+MHRM3qe8BZy7u6INpurXWBy5VJsZDf3BlyvTMB0=
X-Received: by 2002:ab0:310a:: with SMTP id e10mr12908270ual.93.1617999315202; 
 Fri, 09 Apr 2021 13:15:15 -0700 (PDT)
MIME-Version: 1.0
From: Evan M <etm2131@columbia.edu>
Date: Fri, 9 Apr 2021 16:15:04 -0400
Message-ID: <CAJh8_PvnRWh9Ki+Jc6ZKibq64P-Khv85pjTJUcuEJS5OOQB8bA@mail.gmail.com>
Subject: medeleg[11] should be hardwired to zero?
To: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: R93bqhdgpoudR2UbOy019I305pK8S_II
X-Proofpoint-ORIG-GUID: R93bqhdgpoudR2UbOy019I305pK8S_II
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_07:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_notspam policy=inbound score=0
 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1011 bulkscore=10 impostorscore=10 mlxlogscore=436
 lowpriorityscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090146
Received-SPF: pass client-ip=148.163.139.74; envelope-from=etm2131@columbia.edu;
 helo=mx0b-00364e01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Apr 2021 20:16:04 -0000

Hi,

I'm relatively new to RISC-V, so this may be a misunderstanding on my
part. According to the privileged ISA spec v1.12-draft,

> For exceptions that cannot occur in less privileged modes, the corresponding medeleg bits
> should be hardwired to zero. In particular, medeleg[11] is hardwired to zero.

This bit corresponds to RISCV_EXCP_M_ECALL in QEMU, which is OR'd into
delegable_excps in target/riscv/csr.c. Indeed, I can set bit 11
running an RV64 target in QEMU.

Is this a bug in QEMU or a misunderstanding on my part? I'm having a
hard time finding exactly where in the spec it enumerates which
interrupts and exceptions can be delegated from M mode to S mode, so
perhaps I'm off base.

Thanks,
Evan

-- 
Evan Mesterhazy
etm2131@columbia.edu

