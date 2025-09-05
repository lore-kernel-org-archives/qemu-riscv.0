Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC4CA1013
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 14:22:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuXJq-0007Xc-SC; Fri, 05 Sep 2025 10:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuXJo-0007Wp-1q
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 10:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuXJd-0008Ey-OP
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 10:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757082080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUnAleF54zHWLtK6x5C95lNix9wdJClggXJb7jgC2Dc=;
 b=S7gvPSUUS/O1AKYR4yyRARnIThHWWfnjevSvnZYp2k0SzWVBNU1Jlo4jjj9gy6VkOWHRiK
 8l6NjqnTQdXim3DwFJXYtGA11iaFnIN+zIhbBeoRPbOjCRWIzqCxuTEqit9ACnVgifRRZk
 RTJNPIXvsoa3uKwuWXy1hWsSSS/d8QA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-NmHKgTzlMCGjIasqXlYUyQ-1; Fri, 05 Sep 2025 10:21:19 -0400
X-MC-Unique: NmHKgTzlMCGjIasqXlYUyQ-1
X-Mimecast-MFC-AGG-ID: NmHKgTzlMCGjIasqXlYUyQ_1757082078
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5ecf597acso16969001cf.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Sep 2025 07:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082078; x=1757686878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUnAleF54zHWLtK6x5C95lNix9wdJClggXJb7jgC2Dc=;
 b=WPxJkm6IhRddODN0Dx9xEIsFXew9NJqJcC+LuWMTR3B6jUTeCQ8832O/dMbCsWO/49
 nSRKC5wR3HHEEZENmnu5CHscfjfGfK0fYo6yF6fVJ/5zVMwZHbQdXzA6bys1c4XMNrHL
 LuOdVqzMuh2Ew5MuVoIfn5D3O12ozdKP00MX+kIMZZZdwXc7HihCOK32pvWM22eI9jkM
 SLzoJfYOsF0kUk2nJwEFUfkqGu6cXoS9CTsStJzdJfCQKQP3egqRuTFUEOvQmZnvMomI
 4OXYf2hGEZWb9zST3j7nlsuiMM2owZPpRgCzOdGwXM3XquDYJse9t5QGanXyxg8IWMob
 p/Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDFKiqVdhXmNfg3u3hw1yTX8xYH59zy0iXxdAX5EE8wUzm28crXQ+CrA1/Ii4KB7gLkZUyaiM+JTdI@nongnu.org
X-Gm-Message-State: AOJu0Yxg9nHhAHLJLAOMJJ6u4TYIIIZw9uJr6QoJ8MVHMq5c5SAZ3k8S
 zl4CHQ4U5yQOO4YOLzbESDCWMB4MBCiT7bw6k4PoOehF8BujAfnGGlrJGN0NV6vvmivwoZzwfC7
 mcPsWCUAuNbwhl6mB9ekd0y1t0YfIVH0FAchrE2ofDvIi9Mbxsi4HBl7U
X-Gm-Gg: ASbGncvNtEYxRvSp/3jIjIS6hYPgZF4pXClaczf9YJmXgoOa4BM/ppp0iagf2jh0eW6
 1Ov2Zqvyv1rtB+ECZmzOxIPO5ebi79DdJaABJKyfWeiMdk1mrP4UG1nPVwXGTWVxpQXsJf6ZUyP
 uUwlhgPwQPPhKjc1Ok9GxKwQ7fW9iDkSI/WdQPlFnjX7TOgMv6R7+ufAYr2eZBHsyxjZbOhqsc+
 R5/0kGL/oQt/WNN4kO3Tww0L+93doN7DjZY+VFtEY2QvWZKQxHOqlf0uK00X0R9Un4JzkXcrXdn
 SNnMr31jKFDZJFsJtNunt5fYsyGt9/R8
X-Received: by 2002:a05:622a:47c4:b0:4b3:4c51:643e with SMTP id
 d75a77b69052e-4b34c516d88mr151826801cf.68.1757082078237; 
 Fri, 05 Sep 2025 07:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEapsx7hdiwyAtz86wiBs5ovYT7iicwjCRqOzxZu4Gh3/sDmYc1nsrF6JpCKn3Fs+++gIlX/Q==
X-Received: by 2002:a05:622a:47c4:b0:4b3:4c51:643e with SMTP id
 d75a77b69052e-4b34c516d88mr151826171cf.68.1757082077635; 
 Fri, 05 Sep 2025 07:21:17 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b48f780b9fsm45731361cf.41.2025.09.05.07.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:21:16 -0700 (PDT)
Date: Fri, 5 Sep 2025 10:21:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: CJ Chen <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>
Subject: Re: [PATCH RFC v2 9/9] tests/qtest: add test for memory region access
Message-ID: <aLrxz-ULSP3rrm8p@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-10-cjchen@igel.co.jp>
 <CAFEAcA-r5DdZj-+BxBkN+XqWJ3QrN6g+RshjShVoD-Zf1weYPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-r5DdZj-+BxBkN+XqWJ3QrN6g+RshjShVoD-Zf1weYPg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T27rPjsgqZ9GwHlK6jy3myOfbHUxN6fidY7dPxyUOGs_1757082078
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 01, 2025 at 05:57:57PM +0100, Peter Maydell wrote:
> On Fri, 22 Aug 2025 at 10:26, CJ Chen <cjchen@igel.co.jp> wrote:
> >
> > From: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> >
> > This commit adds a qtest for accessing various memory regions. The
> > qtest checks the correctness of handling the access to memory regions
> > by using 'memaccess-testdev'.
> >
> > Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> > Co-developed-by: CJ Chen <cjchen@igel.co.jp>
> > Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> > ---
> >  tests/qtest/memaccess-test.c | 597 +++++++++++++++++++++++++++++++++++
> >  tests/qtest/meson.build      |   9 +
> >  2 files changed, 606 insertions(+)
> >  create mode 100644 tests/qtest/memaccess-test.c
> 
> There seems to be a lot of duplication in these test functions
> (for instance, aren't all of little_b_valid(), little_b_invalid(),
> big_b_valid() and big_b_invalid() identical?  and the various
> _invalid functions seem to have if() blocks where the code in
> the if and the else halves is the same).

Besides that, I don't yet understand some of the test code on endianess,
this might be relevant to the question I raised in the other reply.

Taking example of big_w_valid() test:

static void big_w_valid(QTestState *qts, hwaddr offset)
{
    if (qtest_big_endian(qts)) {
        qtest_writew(qts, base + offset + 0, 0x1100);                     <--- [1]
        qtest_writew(qts, base + offset + 1, 0x3322);                     <--- [2]
        qtest_writew(qts, base + offset + 2, 0x5544);
        qtest_writew(qts, base + offset + 3, 0x7766);
        qtest_writew(qts, base + offset + 4, 0x9988);
        qtest_writew(qts, base + offset + 5, 0xbbaa);
        qtest_writew(qts, base + offset + 6, 0xddcc);
        qtest_writew(qts, base + offset + 7, 0xffee);
        g_assert_cmphex(qtest_readw(qts, base + offset + 0), ==, 0x1133); <--- [3]
        g_assert_cmphex(qtest_readw(qts, base + offset + 1), ==, 0x3355);
        g_assert_cmphex(qtest_readw(qts, base + offset + 2), ==, 0x5577);
        g_assert_cmphex(qtest_readw(qts, base + offset + 3), ==, 0x7799);
        g_assert_cmphex(qtest_readw(qts, base + offset + 4), ==, 0x99bb);
        g_assert_cmphex(qtest_readw(qts, base + offset + 5), ==, 0xbbdd);
        g_assert_cmphex(qtest_readw(qts, base + offset + 6), ==, 0xddff);
        g_assert_cmphex(qtest_readw(qts, base + offset + 7), ==, 0xffee);
    } else {
        qtest_writew(qts, base + offset + 0, 0x1100);                     <--- [4]
        qtest_writew(qts, base + offset + 1, 0x3322);                     <--- [5]
        qtest_writew(qts, base + offset + 2, 0x5544);
        qtest_writew(qts, base + offset + 3, 0x7766);
        qtest_writew(qts, base + offset + 4, 0x9988);
        qtest_writew(qts, base + offset + 5, 0xbbaa);
        qtest_writew(qts, base + offset + 6, 0xddcc);
        qtest_writew(qts, base + offset + 7, 0xffee);
        g_assert_cmphex(qtest_readw(qts, base + offset + 0), ==, 0x2200); <--- [6]
        g_assert_cmphex(qtest_readw(qts, base + offset + 1), ==, 0x4422);
        g_assert_cmphex(qtest_readw(qts, base + offset + 2), ==, 0x6644);
        g_assert_cmphex(qtest_readw(qts, base + offset + 3), ==, 0x8866);
        g_assert_cmphex(qtest_readw(qts, base + offset + 4), ==, 0xaa88);
        g_assert_cmphex(qtest_readw(qts, base + offset + 5), ==, 0xccaa);
        g_assert_cmphex(qtest_readw(qts, base + offset + 6), ==, 0xeecc);
        g_assert_cmphex(qtest_readw(qts, base + offset + 7), ==, 0xffee);
    }
}

It tests on all MRs that are (1) device using big endianess, (2)
.valid.min_access_size=2, (3) .valid.unaligned=true.

First of all, I don't understand why a test case needs to behave
differently according to the TARGET endianess, aka, qtest_big_endian().
IIUC, each of the qtest_writew() should request a WRITE with an integer
value to be applied to the MMIO region, when we know the endianess of the
region (in this case, big endian), we know exactly how it will be read out.

Taking above steps [1-3] as example.  Here [1+2] will write two words to
offset 0x0, 0x1 correspondingly:

  - [1] WRITE(addr=0x0, size=2, data=0x1100)
  - [2] WRITE(addr=0x1, size=2, data=0x3322)

Here, IMHO the result should not depend on the internal property of the
systems (e.g. MR .impl values, after we have unaligned support memory core
should resolve all of these issues by either split 2B MMIO into two 1B, or
do proper padding on start/end to amplify the write if necessary).  Because
we know the device / MR is big endianess, so we should know the result of
the write already, as below:

  - After [1] WRITE(addr=0x0, size=2, data=0x1100), data should look like:

    [0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, ...]
     ^^^^^^^^^^^
    Here it should always follow device's endianess.

  - After [2] WRITE(addr=0x1, size=2, data=0x3322), data should look like:

    [0x11, 0x33, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, ...]
           ^^^^^^^^^^^
    Here it should always follow device's endianess.

Above would be verified by step [3].  Basically it verifies READ(addr=0x0,
size=2) would result in 0x1133, which looks correct.

However the problem is, when GUEST is little endian, the test, even if
written the same data [4-5], expecting different results [6].  That's the
part I don't understand.  I think it would make sense if [6] should also
verify the same as [3].  IOW, the chunk in the "if" section looks like the
right thing to test for both big/little GUEST endianess.

-- 
Peter Xu


