Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C5EEC875E
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 23:48:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeOiq-0007g4-Pa; Thu, 07 Sep 2023 19:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qeOid-0007aw-Op
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qeOiZ-0003tH-RY
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694130443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVCw05aCB3s/VGDwVUHFUT/oIF/ZDlmryp7TTdeg1IY=;
 b=b8QBxfwQa/SIv6WkFkeQkGMV+aoB/PPHYbHXsyK+qcz9OZf4EADZyH8/kT+AC5CSfOZ21I
 xv7Lvwr/+bvE/lG1AkkvnB+V2I/URXXfLPWRg3+boGiilngXWey8Ts7xDdJaaULWS91rp6
 6uaIwBuUjDPvU4ZMSDCsvBI2lk5oZvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-F7wNnbmAOyKbXOOCg2Sevw-1; Thu, 07 Sep 2023 19:47:18 -0400
X-MC-Unique: F7wNnbmAOyKbXOOCg2Sevw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC8398E4EA2;
 Thu,  7 Sep 2023 23:47:17 +0000 (UTC)
Received: from [10.39.192.25] (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2E240C2070;
 Thu,  7 Sep 2023 23:47:12 +0000 (UTC)
Message-ID: <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
Date: Fri, 8 Sep 2023 01:47:10 +0200
MIME-Version: 1.0
Subject: Re: riscv64 virt board crash upon startup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu devel list <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Warkentin, Andrei" <andrei.warkentin@intel.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
 <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Question for Gerd below:

On 9/7/23 14:29, Philippe Mathieu-Daudé wrote:
> On 7/9/23 13:25, Laszlo Ersek wrote:
>> This is with QEMU v8.1.0-391-gc152379422a2.
>>
>> I use the command line from (scroll to the bottom):
>>
>>    https://github.com/tianocore/edk2/commit/49f06b664018
>>
>> (with "-full-screen" removed).
>>
>> The crash is as follows:
>>
>>    Unexpected error in object_property_find_err() at
>> ../../src/upstream/qemu/qom/object.c:1314:
>>    qemu: Property 'qemu-fixed-text-console.device' not found
>>    Aborted (core dumped)
> 
> Cc'ing Marc-André for commit b208f745a8
> ("ui/console: introduce different console objects")

First bad commit:

58d5870845c61cea1e7df287b86c2607b2bf48a9 is the first bad commit
commit 58d5870845c61cea1e7df287b86c2607b2bf48a9
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Aug 30 13:38:03 2023 +0400

    ui/console: move graphic fields to QemuGraphicConsole
    
    Move fields specific to graphic console to the console subclass.
    
    qemu_console_get_head() is adapated to accomodate QemuTextConsole, and
    always returns 0.
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20230830093843.3531473-30-marcandre.lureau@redhat.com>

 ui/console.c | 110 ++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 64 insertions(+), 46 deletions(-)

Bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [c152379422a204109f34ca2b43ecc538c7d738ae] Merge tag 'ui-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging
git bisect bad c152379422a204109f34ca2b43ecc538c7d738ae
# status: waiting for good commit(s), bad commit known
# good: [17780edd81d27fcfdb7a802efc870a99788bd2fc] Merge tag 'quick-fix-pull-request' of https://gitlab.com/bsdimp/qemu into staging
git bisect good 17780edd81d27fcfdb7a802efc870a99788bd2fc
# good: [912a9efd6bf4d808b238e17d26de2e4bb9bc4743] Merge tag 'pull-aspeed-20230901' of https://github.com/legoater/qemu into staging
git bisect good 912a9efd6bf4d808b238e17d26de2e4bb9bc4743
# bad: [6ce7b1fa8844db668f0a3c0b37b78b08d331a16a] ui/console: remove need for g_width/g_height
git bisect bad 6ce7b1fa8844db668f0a3c0b37b78b08d331a16a
# good: [6505fd8d2390e57c6a2e84f9c07b9e408ad7da76] ui/vc: move VCCharDev specific fields out of QemuConsole
git bisect good 6505fd8d2390e57c6a2e84f9c07b9e408ad7da76
# good: [7fa4b8041b870951642515e0954d274ec4d599b1] ui/console: update the head from unused QemuConsole
git bisect good 7fa4b8041b870951642515e0954d274ec4d599b1
# good: [b2bb9cc43dbb942a5333a6271629fd6094771bca] ui/vc: move text fields to QemuTextConsole
git bisect good b2bb9cc43dbb942a5333a6271629fd6094771bca
# bad: [98ee9dab81b2bc75d6ccf86681053ed80f9fc9af] ui/vc: fold text_console_do_init() in vc_chr_open()
git bisect bad 98ee9dab81b2bc75d6ccf86681053ed80f9fc9af
# bad: [58d5870845c61cea1e7df287b86c2607b2bf48a9] ui/console: move graphic fields to QemuGraphicConsole
git bisect bad 58d5870845c61cea1e7df287b86c2607b2bf48a9
# first bad commit: [58d5870845c61cea1e7df287b86c2607b2bf48a9] ui/console: move graphic fields to QemuGraphicConsole

The problem is that the commit in question didn't update qemu_console_is_multihead().

qemu_console_is_multihead() checks, effectively, if there is another console in the system that refers to *this* console's device, but under a different "head" number.

I don't know why qemu_console_is_multihead() used a lot of QOM trickery for this in the first place, but here's what I'd propose as fix -- simply try to locate a QemuGraphicConsole in "consoles" that references the same "device" that *this* QemuGraphicConsole references, but by a different "head" number.


* Patch #1 -- make "qemu_console_is_multihead" static:

diff --git a/include/ui/console.h b/include/ui/console.h
index 1ccd432b4d64..d715f88b1be2 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -506,7 +506,6 @@ bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
 bool qemu_console_is_gl_blocked(QemuConsole *con);
-bool qemu_console_is_multihead(DeviceState *dev);
 char *qemu_console_get_label(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
 uint32_t qemu_console_get_head(QemuConsole *con);
diff --git a/ui/console.c b/ui/console.c
index e4d61794bb2c..adacc3473140 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2365,7 +2365,7 @@ bool qemu_console_is_gl_blocked(QemuConsole *con)
     return con->gl_block;
 }
 
-bool qemu_console_is_multihead(DeviceState *dev)
+static bool qemu_console_is_multihead(DeviceState *dev)
 {
     QemuConsole *con;
     Object *obj;


* Patch #2 -- only check QemuGraphicConsoles for referecing our "device" by a different "head" number:

diff --git a/ui/console.c b/ui/console.c
index adacc3473140..2ee65207b430 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2373,6 +2373,9 @@ static bool qemu_console_is_multihead(DeviceState *dev)
     uint32_t h;
 
     QTAILQ_FOREACH(con, &consoles, next) {
+        if (!QEMU_IS_GRAPHIC_CONSOLE(con)) {
+            continue;
+        }
         obj = object_property_get_link(OBJECT(con),
                                        "device", &error_abort);
         if (DEVICE(obj) != dev) {

This is what fixes the crash!


* Patch #3 -- eliminate QOM trickery:

diff --git a/ui/console.c b/ui/console.c
index 2ee65207b430..d3172d520b9a 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2365,10 +2365,9 @@ bool qemu_console_is_gl_blocked(QemuConsole *con)
     return con->gl_block;
 }
 
-static bool qemu_console_is_multihead(DeviceState *dev)
+static bool qemu_graphic_console_is_multihead(QemuGraphicConsole *c)
 {
     QemuConsole *con;
-    Object *obj;
     uint32_t f = 0xffffffff;
     uint32_t h;
 
@@ -2376,14 +2375,12 @@ static bool qemu_console_is_multihead(DeviceState *dev)
         if (!QEMU_IS_GRAPHIC_CONSOLE(con)) {
             continue;
         }
-        obj = object_property_get_link(OBJECT(con),
-                                       "device", &error_abort);
-        if (DEVICE(obj) != dev) {
+        QemuGraphicConsole *candidate = QEMU_GRAPHIC_CONSOLE(con);
+        if (candidate->device != c->device) {
             continue;
         }
 
-        h = object_property_get_uint(OBJECT(con),
-                                     "head", &error_abort);
+        h = candidate->head;
         if (f == 0xffffffff) {
             f = h;
         } else if (h != f) {
@@ -2402,7 +2399,7 @@ char *qemu_console_get_label(QemuConsole *con)
             bool multihead;
 
             dev = DEVICE(c->device);
-            multihead = qemu_console_is_multihead(dev);
+            multihead = qemu_graphic_console_is_multihead(c);
             if (multihead) {
                 return g_strdup_printf("%s.%d", dev->id ?
                                        dev->id :

Gerd, here's the question for you: why are "device" and "head" QOM properties in the first place? What are they needed for?

I've found the following two commits:
- aa2beaa1f57c ("console: add device link to QemuConsoles", 2013-04-25)
- 5643706a0950 ("console: add head to index to qemu consoles.", 2014-03-05)

But I don't understand *how* having a "link" helps for figuring out which qemu console displays which device.


Patch #4 -- fix search awkwardness:

diff --git a/ui/console.c b/ui/console.c
index d3172d520b9a..bcc3398ee2c0 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2368,8 +2368,6 @@ bool qemu_console_is_gl_blocked(QemuConsole *con)
 static bool qemu_graphic_console_is_multihead(QemuGraphicConsole *c)
 {
     QemuConsole *con;
-    uint32_t f = 0xffffffff;
-    uint32_t h;
 
     QTAILQ_FOREACH(con, &consoles, next) {
         if (!QEMU_IS_GRAPHIC_CONSOLE(con)) {
@@ -2380,10 +2378,7 @@ static bool qemu_graphic_console_is_multihead(QemuGraphicConsole *c)
             continue;
         }
 
-        h = candidate->head;
-        if (f == 0xffffffff) {
-            f = h;
-        } else if (h != f) {
+        if (candidate->head != c->head) {
             return true;
         }
     }

Because the loop compares the "head" number between the *first two* graphical consoles it finds that reference the same device as we do.

Instead of that, it's easiest to just find one graphical console that references the same device as we do, but by a "head" number that differs from our "head" number.

Thanks
Laszlo

>>
>> (Full backtrace attached.)
>>
>> If I replace the "-device virtio-gpu-pci" option with "-nographic", then
>> there is no crash; QEMU launches fine and the guest starts booting fine.
>>
>> I think this is a board-related problem; the riscv virt board code
>> likely does not set up the console properly.
>>
>> Furthermore, I reckon this could be regression. When Sunil's above patch
>> was committed to edk2 (2023-06-23), the graphical guest window must have
>> worked still.
>>
>> Laszlo
> 


