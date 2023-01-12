Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFy00-0003Ux-0Q
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 08:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFxzd-0002vZ-VD
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFxzV-0003kT-G4
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kd6neTRgQmgMh6DNG6DwXYTgAy1+iQonnVyEcqozWM=;
 b=M3QChTRs9IMVNBdFmIKFEcC/xyjX/mF3YLS4twNJZB3F5zdCq2Da+gwMuF3DwY0F4RQ/ne
 nnbHv/oev5c5PM+hVXuxvbdVgJSt2bwB3kgZfXt60UJ5RAEBqNjzu+r9SRSO/IhOekY2mv
 KSHNat6B2mnXVj9V5Kkgdl1fn+jmc/Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-eTcFwHCVN6qRrC8DQ-_i8g-1; Thu, 12 Jan 2023 08:51:33 -0500
X-MC-Unique: eTcFwHCVN6qRrC8DQ-_i8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso4295591wml.9
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 05:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kd6neTRgQmgMh6DNG6DwXYTgAy1+iQonnVyEcqozWM=;
 b=inFjHRWSDNoKwXND29M8tUdPPCVZkw+1pOLjHnTSwapB9aB4rgorGo0yZzgiV+lLgs
 HPPIwjFls8WQVNru0XqrjTgBeIYEg5MfbIfkaRt/iPOpjXAkDKn4hMz30xDuOOd4rEIL
 xEPFz07H3Z5nU3hfGDBzElffkfE34FbZDTVcIL+f+fVxG3Ext6OnL1RX3tC4Ctpbdt3P
 YiVTcx4ID8kugcObKT4vLKpXyfSZF6Jns1C6Xu1Cj0BF1Ua4JzRDtAg8G//GJ34S5QLk
 7XrI9fgImLEqmxJkP0l1HmeJJ+un2QwbhItb5XXNavYabuQpIDspSoCIyNEDlKCuNPeP
 qQgg==
X-Gm-Message-State: AFqh2krFAmCMRJM5CBCfX8Cn0nTq6QGFB/QNIYKn3TpxH4AELcmDBWAX
 +01JDAUAVvDpASI2ZT/DgQTQ6pHs0LZezFDkeRE9j90aOxAcN44cM28VONB752ih0M7nczf7au3
 Us9n1WtMGH4JC0QE=
X-Received: by 2002:a5d:6443:0:b0:2ba:ecb4:5e19 with SMTP id
 d3-20020a5d6443000000b002baecb45e19mr14872466wrw.11.1673531491944; 
 Thu, 12 Jan 2023 05:51:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCDWMX0+MZ6xrmfjPzxy6tksZkIeYbgnZCPZJmOxg8ZdZz+JvkCWpNGGEsq87he7gMEfFuPQ==
X-Received: by 2002:a5d:6443:0:b0:2ba:ecb4:5e19 with SMTP id
 d3-20020a5d6443000000b002baecb45e19mr14872431wrw.11.1673531491584; 
 Thu, 12 Jan 2023 05:51:31 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 z9-20020a7bc7c9000000b003d9ef37ec1bsm17340547wmk.5.2023.01.12.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:51:30 -0800 (PST)
Date: Thu, 12 Jan 2023 08:51:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <20230112082537-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230112115005.1504812-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 13:51:56 -0000

On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> docs/devel/style.rst mandates:
> 
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
> 
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
> 
> A few violations have crept in.  Fix them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

With my awesome grep skillz I found one more:
$ grep -r --include='*.h' qemu/osdep.h
include/block/graph-lock.h:#include "qemu/osdep.h"

Looks like all C files must include qemu/osdep.h, no?
How about

1- add -include qemu/osdep.h on compile command line
   drop #include "qemu/osdep.h" from C files
2- drop double include guards, replace with a warning.

following patch implements part 2:


qemu/osdep: don't include it from headers

doing so will lead to trouble eventually - instead of
working around such cases make it more likely it will fail.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7d059ad526..e4a60f911c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -24,7 +24,12 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#ifndef QEMU_OSDEP_H
+#ifdef QEMU_OSDEP_H
+#warning "Never include qemu/osdep.h from a header!"
+#endif
+
+static inline void qemu_osdep_never_include_from_header(void) {}
+
 #define QEMU_OSDEP_H
 
 #include "config-host.h"
@@ -714,5 +719,3 @@ static inline int platform_does_not_support_system(const char *command)
 #ifdef __cplusplus
 }
 #endif
-
-#endif


