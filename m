Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F739CA1015
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 14:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuAXO-0005cn-K2; Thu, 04 Sep 2025 10:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuAXN-0005cU-Cb
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 10:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uuAXH-0001tZ-V7
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 10:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756994514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2FF7QYh1G4sd68hTZrP6WTKiZuCRd21KT76pY9ILtQ=;
 b=U6mWXGlJ353i854bCvK+IWCDlpUOjhWlWFZJHI11IWff9VApR3ajdHjrSJFRWYDI/0XVAq
 KZqpOoEC3lYqz3pkXZfnabM0luWSX06zZXH8XpAloiRQUFUEcE2UdbqdiXtbSGOSZ9uJkT
 OCLXimziHutDiTIjfglZp2+lSWf2Fkg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-KwQJb5hHNESsAgoZ8_bwUw-1; Thu, 04 Sep 2025 10:01:53 -0400
X-MC-Unique: KwQJb5hHNESsAgoZ8_bwUw-1
X-Mimecast-MFC-AGG-ID: KwQJb5hHNESsAgoZ8_bwUw_1756994511
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-803d02bd834so137060985a.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 07:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756994511; x=1757599311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2FF7QYh1G4sd68hTZrP6WTKiZuCRd21KT76pY9ILtQ=;
 b=tFhshGqPOIKTs5B0bCZ2PwgfI6qF8uoVUVx8FEOcd7ix9VBqflhl4UcPilYIUB52Qd
 +TO7UQYWaA3UZqbM+oVe3evgpuUhSxTINnFy6K14v9MESdqj+PwzVgabGZHm/sA3XcXo
 +gCX+60cZTQGQ3LHHyRQfdSci+tsj+66GePyaQutprfdRRbNV+9V/gqEUWESW/XyvM4R
 jpa5sawqQ8Zh91PR7UlFFPJ0v8+8wM5p6nzGHhOCKoGv5HM6MwF39jSLiPpDCh7PURQ8
 gWtOXVDWR19EaNm9Ye4FpEf4T/sig7H0P5dLjUnSqFDYBaF44RrVu8sLe76qZY9cV9GH
 dvSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE+CZkw0RlX2Hmv+S/HKBQN5tCzxM1nj9sFkc8xhy9FaG01HajPRX0MxYAsDa1/xDnvIKMEPRKj50G@nongnu.org
X-Gm-Message-State: AOJu0Yw/W8xpyM8i/Ge7o1e5Ydf+ar4pWCGi48HfiYXgTpEYfn5qq5Vd
 dXwi1wvVYRMJr2OdHIRUL9rw41C9MUBmE68yrK4KObgLI/LXWNd43zr3kRyno1ppN0Wz2RUrO7D
 nqni/rf6JnEFML8/H14Z8DMRR5pdtPiG0K5y2PQrEVu20E7lJSxYSpFmA
X-Gm-Gg: ASbGncsFH2jKtnttv5W9H5E/OYuyBxYj5X7isXPD2LFfPeWG60sAha0w03i0PTnX2KB
 iecrt9V+dWuJI6aaW4kX5lVdfwPWWSKYhj+av7gmUKFnOOMf6A4CLjvMyDJ/QfAEjFwmDXI0iDL
 3KrXO44OMFSbf/ecWubBhd0lN7GGOvG1yfptpvNPBSyk+z1HkUgwP3stN2zE5+L8ZAvdKKVibdW
 p3qjlHXEp8dOMTH43qaLkCV9V4h7jT4ZEULqb8h8wplWi+8IQptSSWcX5nnD58wzuld6MpuQ6Cc
 S/RI3abzVbJe/DgeeP6VZ+L6Gmtkvit9
X-Received: by 2002:a05:620a:2954:b0:809:8ccc:ba7c with SMTP id
 af79cd13be357-8098cccbb97mr872332685a.29.1756994509986; 
 Thu, 04 Sep 2025 07:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMNV+IYKzorYL3x13harapQjY27o7mbqLf8/D+PtqSi5EgT37hw9CVgjbMnql3fCapJDAllw==
X-Received: by 2002:a05:620a:2954:b0:809:8ccc:ba7c with SMTP id
 af79cd13be357-8098cccbb97mr872324985a.29.1756994509259; 
 Thu, 04 Sep 2025 07:01:49 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-80aa6e4914csm282846485a.16.2025.09.04.07.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 07:01:48 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:01:35 -0400
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
Subject: Re: [RFC PATCH v2 8/9] hw/misc: add test device for memory access
Message-ID: <aLmbv0ZEKjPFuYxt@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-9-cjchen@igel.co.jp>
 <CAFEAcA9FAnnQrAf1eUPr1=FQ+=Wbu13gyfj3T3z+k6BhxHj6uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9FAnnQrAf1eUPr1=FQ+=Wbu13gyfj3T3z+k6BhxHj6uQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8W0Kdxsu4w5WEzGwPzC5xBSqRnpX5nLNyFKkSlML83Q_1756994511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 01, 2025 at 06:03:41PM +0100, Peter Maydell wrote:
> Could we have a comment in this header file that documents
> what interface the test device presents to tests, please?
> Both this patch and the test-case patch are hard to
> review, because I don't know what the test device is
> trying to do or what the test code is able to assume
> about the test device.

Since the series is withdrawed.. but still I feel like I'll need to read
this series when it's picked up again, I took some time (while the brain
cache is still around..) study the code, I think I get the rough idea of
what this testdev is about.  If it's gonna be picked up by anyone, hope
below could help a bit.  Also for future myself..

Firstly, the testdev creates a bunch of MRs, with all kinds of the
attributes to cover all max/min access sizes possible & unaligned access &
endianess.  The test cases are exactly tailored for this testdev, as the
testcase needs to know exactly which offset contains which type of MR.  The
tests must be run correspondingly on the paired MR to work.

There're 16 groups of MRs / tests, each group contains below num of MRs:

#define N_OPS_LIST_LITTLE_B_VALID   80
#define N_OPS_LIST_LITTLE_B_INVALID 40
#define N_OPS_LIST_LITTLE_W_VALID   60
#define N_OPS_LIST_LITTLE_W_INVALID 30
#define N_OPS_LIST_LITTLE_L_VALID   40
#define N_OPS_LIST_LITTLE_L_INVALID 20
#define N_OPS_LIST_LITTLE_Q_VALID   20
#define N_OPS_LIST_LITTLE_Q_INVALID 10
#define N_OPS_LIST_BIG_B_VALID      80
#define N_OPS_LIST_BIG_B_INVALID    40
#define N_OPS_LIST_BIG_W_VALID      60
#define N_OPS_LIST_BIG_W_INVALID    30
#define N_OPS_LIST_BIG_L_VALID      40
#define N_OPS_LIST_BIG_L_INVALID    20
#define N_OPS_LIST_BIG_Q_VALID      20
#define N_OPS_LIST_BIG_Q_INVALID    10

That's a total of 600 (which is, N_OPS_LIST) MRs at the base address of the
testdev, specified by, for example:

  -device memaccess-testdev,address=0x10000000

Each MR will be 32B (MEMACCESS_TESTDEV_REGION_SIZE) in size, sequentially
appended and installed to base address offset. All of them internally
backed by:

    testdev->mr_data = g_malloc(MEMACCESS_TESTDEV_MR_DATA_SIZE);

Here, BIG/LITTLE decides the endianess of the MR, B/W/L/Q decides the
min_access_size of the MR, which isn't clear at all to me..  IIUC it's
hidden inside the skip_core() check where it skips anything except when
valid_min == required_min.  So only those MRs that satisfy will be created.

And just to mention, IIUC these numbers are not random either, they are
exactly how many possible MRs that we can create under the specific
category of MR group.  Changing that could either causing uninitialized MRs
(under some group) or trigger assertions saying MR list too small:

fill_ops_list:
        if (idx > ops_len) {
                g_assert_not_reached();
        }

This is not clear either.. better document this if it will be picked up one
day.

An example for definition of N_OPS_LIST_LITTLE_B_VALID: we can create 80
such MRs when the MR is (1) LITTLE (2) min_access_size=1 (3) allows
.valid.unaligned.  We'll skip the rest in skip_core() when building the
list of MRs.  And yes, here (3) isn't clear either: VALID here means "the
MR allows unaligned access from API level", which implies
.valid.unaligned=true.  OTOH, INVALID implies .valid.unaligned=false.
NOTE: it doesn't imply at all about .impl.unaligned.

The test case should be tailored for this device, because for each test it
will run, it'll run exactly on top of the group of MRs that the test case
pairs with.

Taking example of big_w_valid(): it'll run the test on all MRs that is (1)
BIG, (2) min_access_size=2, (3) VALID to use unaligned access, aka,
.valid.unaligned=true.

Said above, I'll also raise a question that I don't understand, on the
testdev implementation.  It's about endianess of the MR and how data
endianess is processed in the test dev.  Please shoot if anyone knows.

Again, taking the example of BIG write() of a test MR, I wonder why the
testdev has this:

static void memaccess_testdev_write_big(void *opaque, hwaddr addr,
                                        uint64_t data, unsigned int size)
{
    g_assert(addr + size < MEMACCESS_TESTDEV_REGION_SIZE);
    void *d = (uint8_t *)opaque + addr;
    stn_be_p(d, size, data);
}

It means when the ->write() triggers, it assumes "data" here is host
endianess, then convert that to MR's endianess, which is BE in this case.

But haven't we already done that before reaching ->write()?  Memory core
will do the endianess conversion (from HOST -> MR endianess) already here
before reaching the write() hook, AFAICT:

memory_region_dispatch_write()
    adjust_endianness(mr, &data, op);
        if ((op & MO_BSWAP) != devend_memop(mr->ops->endianness)) {

Here, MO_BSWAP shouldn't normally be set. devend_memop() should read BE.
On my host (x86_64) it means it'll swap once to MR endianess.  IIUC, now
the whole "data" field already in MR endianess and should be directly put
into the backend memdev storage.  I don't think I understand why above
stn_be_p() is not a memcpy().  Answers welcomed..

-- 
Peter Xu


