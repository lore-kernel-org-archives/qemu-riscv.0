Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93029CCD184
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 16:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6tT5-00014y-Vk; Thu, 09 Oct 2025 12:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1v6tT3-00013I-Qr
 for qemu-riscv@nongnu.org; Thu, 09 Oct 2025 12:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1v6tSv-0001mU-J3
 for qemu-riscv@nongnu.org; Thu, 09 Oct 2025 12:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760027161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wVHBKHd8ctKlMm/6J+16ORuNlJYlN/p0wWwUE7aRsTY=;
 b=ch/YMNDk3AcnfFkKDUEosw/9lZpiaQ5YXkwSr/kRJQMG0l8sSmv6VdM/yGm3hN5i0NMaIm
 yeYBpqCggbqT83NUcWkLDDQtvL6yuhgLzklo6QhGrGNddItBvjgP8bwdCEPTpa/lDbCYCY
 NOgOXR7wnbAfk6xgZG/18MVfXaATcbE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-4uhHt4YUPAOvON3BSchYFg-1; Thu,
 09 Oct 2025 12:25:59 -0400
X-MC-Unique: 4uhHt4YUPAOvON3BSchYFg-1
X-Mimecast-MFC-AGG-ID: 4uhHt4YUPAOvON3BSchYFg_1760027158
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 55FAF180034A
 for <qemu-riscv@nongnu.org>; Thu,  9 Oct 2025 16:25:58 +0000 (UTC)
Received: from localhost (unknown [10.45.224.22])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C36131800578
 for <qemu-riscv@nongnu.org>; Thu,  9 Oct 2025 16:25:57 +0000 (UTC)
Date: Thu, 9 Oct 2025 17:25:56 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-riscv@nongnu.org
Subject: target/riscv: warning on current master: writing 8 bytes into a
 region of size 4
Message-ID: <20251009162556.GC5720@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qgYPOJPXo_o-z6vLQ_zXm7ujjNsokg62HzJECrZSf_0_1760027158
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

When compiling the latest master branch, CONFIG_ATOMIC64 is defined,
and I get this warning:

----
In function ‘stq_he_p’,
    inlined from ‘translator_ld’ at ../accel/tcg/translator.c:359:13,
    inlined from ‘translator_ldl_end’ at ../accel/tcg/translator.c:491:10,
    inlined from ‘translator_ldl’ at /home/rjones/d/qemu/include/exec/translator.h:201:12,
    inlined from ‘decode_opc’ at ../target/riscv/translate.c:1236:18,
    inlined from ‘riscv_tr_translate_insn’ at ../target/riscv/translate.c:1348:5:
/home/rjones/d/qemu/include/qemu/bswap.h:295:5: warning: writing 8 bytes into a region of size 4 [-Wstringop-overflow=]
  295 |     __builtin_memcpy(ptr, &v, sizeof(v));
      |     ^
../accel/tcg/translator.c: In function ‘riscv_tr_translate_insn’:
../accel/tcg/translator.c:489:14: note: destination object ‘val’ of size 4
  489 |     uint32_t val;
      |              ^
../accel/tcg/translator.c:489:14: note: at offset [1, 4] into destination object ‘val’ of size 4
----

Looking at the code I can see why it's happening.  However I don't see
a simple fix.

The function 'translator_ldl_end' really wants a 32 bit result, and it
seems like the 64 bit case would never be called, although I'm not
sure ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit


