Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG1bl-0001XO-Qn
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 12:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1bg-0001T7-AQ
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1be-0002yN-W3
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRnRLfWYBmS7QFJ95fJ0/Y/8sdTtZKcRN8b0GCktwzg=;
 b=dzgoS4UdL/1B/G5owX+M+63j3NojTI6pYBgXAYC79YbGjJRpRNuuo9XaFc8r1bC4BCuCAs
 pXi0qNuKRKvGUMlNLa+ZK24F+SOnMrPA3eTDk4pBc07npZhkypGW/l00QMJcGr6QWNT2Jc
 O7MlWsRrnLS683NvteybPERJDKNSmSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-tqpvNsoIO4C9aL1E_vrh1g-1; Thu, 12 Jan 2023 12:41:35 -0500
X-MC-Unique: tqpvNsoIO4C9aL1E_vrh1g-1
Received: by mail-wr1-f69.google.com with SMTP id
 o5-20020adfba05000000b0029064ccbe46so3663743wrg.9
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 09:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRnRLfWYBmS7QFJ95fJ0/Y/8sdTtZKcRN8b0GCktwzg=;
 b=3qIZbYiLDKl/qZXE3iKUUZX+AN33TFPftKjYvjWY+DBiXTB7P1UuFaGOeONYkOxtMA
 sjomjVp2hEwxE1T6vU9YVooIkTk1JaXHPVUWFbg4iDpcCl96BAcQCsyqJ/eTJ0pvmQes
 qmWG4g0fVJ6rvcsm3fSS7sJXDnBw2OfRQ7JQWrHi5k6X0tFTtBkB1nKgoF9a0PspcsnU
 xsQ420VbC+dToZz9RkQAXbENKUB9znvuq5qnzBz7rUDpE/Gm1XXecJ1PWcycrJ2AP/he
 EyJL47rrrHUC/0cgSEElQfZ8rai1V9KWSAZQpDDaGOwmrqg+rY/qdr/8su5Q0X9Ike+d
 oyeQ==
X-Gm-Message-State: AFqh2krGVTyoIcBAs9ofdDEQOF9GNx+2cVle2IgdbSHuKhpBp+WP2CEN
 t7qfG2EdEiTDUZb1KnVIWr+DaQkzE9q+jcFNj4c/+yPsfq9HwaEV3eL+nR55puWpEeES20VXBFq
 HJJznxEaZRCEKSwY=
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr55535586wml.25.1673545294728; 
 Thu, 12 Jan 2023 09:41:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv2Nfl2zhadh45vjFKuA0ruFaFWL/u9Me8rBybNq4JDbL2Atvy21u073sGdrWEYpGLxX/RH+w==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr55535567wml.25.1673545294497; 
 Thu, 12 Jan 2023 09:41:34 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm17027607wrx.97.2023.01.12.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:41:33 -0800 (PST)
Date: Thu, 12 Jan 2023 12:41:29 -0500
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
Message-ID: <20230112124011-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230112115005.1504812-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
X-List-Received-Date: Thu, 12 Jan 2023 17:43:20 -0000

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

here's v2 - can be applied after you fix all instances of this.
Feel free to use.

--->

qemu/osdep: we don't include it from headers

doing so will lead to trouble eventually - instead of silently working
around such cases make it more likely it will fail.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

-- 

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7d059ad526..3ddeb7fd41 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -24,7 +24,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#ifndef QEMU_OSDEP_H
+#ifdef QEMU_OSDEP_H
+#warning "Never include qemu/osdep.h from a header!"
+#else
 #define QEMU_OSDEP_H
 
 #include "config-host.h"


