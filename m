Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG1gF-000438-KV
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 12:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1gE-00042j-K6
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:47:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1gC-0003wH-RO
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/q8S/JFjp2otsghtMnNM7eaxXDSxB6fyjCEWaw5dovY=;
 b=C3jZgAFJEpWUhnMSnloOeag7JTodrNH7CLoYmuDEMylbwBVwWd1Zkq/HUr0VK0+PxlAGUE
 G3lWgUt1irfNRpj/L5ZE6NUUQYfXlJlthSMhjjzcNNn3QQKun8SB2HxLTy2I1UcyMZeIkb
 /7JxpjvqLy5F5SjS3znR3m1WHSieBqc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-_bZlUyOSPc6pDJRG5gMmIg-1; Thu, 12 Jan 2023 12:47:55 -0500
X-MC-Unique: _bZlUyOSPc6pDJRG5gMmIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g24-20020adfa498000000b002bbeb5fc4b7so3096359wrb.10
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 09:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/q8S/JFjp2otsghtMnNM7eaxXDSxB6fyjCEWaw5dovY=;
 b=XOS31zziOfIx0yP9/rAElZ1Upb+MWooN7Ei7CzwwDM5TOellGoKfRR3sKZd+FUWmiT
 GT5IhUmmlhFMSRXQyZZuWOsA1GMGnwdXC4kNMYVtNoUotyArRoGzT/aHris9azUvkSSw
 e3NT8gHMEh9NQmWNAHYA5qvC9BxK8ZQNJE7VbEUQ2HSRFYkr0Zqj5u4g3sWW/b90BfoG
 J6tAtb0P5eGd1WXLLRRRkFJ23CyBSQrLeQfTZiOkAEnpAUp3cFthjesO2qXtnaFhSldr
 RyUFyXmqMRLp6Pirbo5A6cnT5ag+s1g46pxraL1bcsfT5kriE3hJzouYMEYwhngzeNme
 BMnw==
X-Gm-Message-State: AFqh2krAQUpPAH/91tKzZYGPip9eR3JCH3DTl43QwRFvFsigfdert/3m
 84AuxZpPYYm/X2PyI67aFYzSFET/CZKl8HBxqxqjLhUs0pbasR745Ob5r4NxIDA/zIZskyfRsIF
 pqKZd+LaYvO/bzl8=
X-Received: by 2002:a05:600c:601b:b0:3d3:56ce:5693 with SMTP id
 az27-20020a05600c601b00b003d356ce5693mr55157390wmb.17.1673545674172; 
 Thu, 12 Jan 2023 09:47:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuSDDDpaT5RVO83IPz9PPIzxQXSBtPASceLihuN8y4ssRDLx2e2vRMkj1s0bLtc50mYHXYY8A==
X-Received: by 2002:a05:600c:601b:b0:3d3:56ce:5693 with SMTP id
 az27-20020a05600c601b00b003d356ce5693mr55157383wmb.17.1673545673979; 
 Thu, 12 Jan 2023 09:47:53 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b002368f6b56desm20327271wrr.18.2023.01.12.09.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:47:53 -0800 (PST)
Date: Thu, 12 Jan 2023 12:47:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <20230112124707-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <20230112085520-mutt-send-email-mst@kernel.org>
 <87zgan4xoo.fsf@pond.sub.org>
 <20230112123434-mutt-send-email-mst@kernel.org>
 <Y8BG/ytLLePRk1ki@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y8BG/ytLLePRk1ki@redhat.com>
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
X-List-Received-Date: Thu, 12 Jan 2023 17:47:58 -0000

On Thu, Jan 12, 2023 at 05:44:31PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 12, 2023 at 12:37:46PM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 12, 2023 at 03:47:19PM +0100, Markus Armbruster wrote:
> > > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > > 
> > > > On Thu, Jan 12, 2023 at 08:51:32AM -0500, Michael S. Tsirkin wrote:
> > > >> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > > >> > docs/devel/style.rst mandates:
> > > >> > 
> > > >> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> > > >> >     the behavior of core system headers like <stdint.h>.  It must be
> > > >> >     the first include so that core system headers included by external
> > > >> >     libraries get the preprocessor macros that QEMU depends on.
> > > >> > 
> > > >> >     Do not include "qemu/osdep.h" from header files since the .c file
> > > >> >     will have already included it.
> > > >> > 
> > > >> > A few violations have crept in.  Fix them.
> > > >> > 
> > > >> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > >> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > >> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > >> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > > >> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > >> 
> > > >> With my awesome grep skillz I found one more:
> > > >> $ grep -r --include='*.h' qemu/osdep.h
> > > >> include/block/graph-lock.h:#include "qemu/osdep.h"
> > > 
> > > Crept in after I prepared my v1.  I neglected to re-check.
> > > 
> > > > Also:
> > > > $ grep -r --include='*.inc' qemu/osdep.h
> > > > ui/vnc-enc-zrle.c.inc:#include "qemu/osdep.h"
> > > > crypto/akcipher-nettle.c.inc:#include "qemu/osdep.h"
> > > > crypto/akcipher-gcrypt.c.inc:#include "qemu/osdep.h"
> > > > crypto/rsakey-nettle.c.inc:#include "qemu/osdep.h"
> > > > crypto/cipher-gnutls.c.inc:#include "qemu/osdep.h"
> > > > target/xtensa/core-dc233c/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > > target/xtensa/core-sample_controller/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > > target/xtensa/core-de212/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > > target/xtensa/core-dc232b/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > > target/xtensa/core-fsf/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > > target/cris/translate_v10.c.inc:#include "qemu/osdep.h"
> > > 
> > > Good point.  Looks like I successfully supressed all memory of .inc.
> > > 
> > > >> Looks like all C files must include qemu/osdep.h, no?
> > > 
> > > I remember there are a few exceptions, but I don't remember which .c
> > > they are.  Hmm... see commit 4bd802b209cff612d1a99674a91895b735be8630.
> > > 
> > > >> How about
> > > >> 
> > > >> 1- add -include qemu/osdep.h on compile command line
> > > >>    drop #include "qemu/osdep.h" from C files
> > > 
> > > Then you need to encode the exceptions in the build system.  Which might
> > > not be a bad thing.
> > > 
> > > >> 2- drop double include guards, replace with a warning.
> > > >> 
> > > >> following patch implements part 2:
> > > >> 
> > > >> 
> > > >> qemu/osdep: don't include it from headers
> > > >> 
> > > >> doing so will lead to trouble eventually - instead of
> > > >> working around such cases make it more likely it will fail.
> > > >> 
> > > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >> 
> > > >> ---
> > > >> 
> > > >> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > >> index 7d059ad526..e4a60f911c 100644
> > > >> --- a/include/qemu/osdep.h
> > > >> +++ b/include/qemu/osdep.h
> > > >> @@ -24,7 +24,12 @@
> > > >>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > > >>   * See the COPYING file in the top-level directory.
> > > >>   */
> > > >> -#ifndef QEMU_OSDEP_H
> > > >> +#ifdef QEMU_OSDEP_H
> > > >> +#warning "Never include qemu/osdep.h from a header!"
> > > >> +#endif
> > > >> +
> > > >> +static inline void qemu_osdep_never_include_from_header(void) {}
> > > >> +
> > > 
> > > Why do you need the function, too?
> > 
> > This seems to give a bit more info if header does get included
> > twice: instead of just a warning on the second include compiler says
> > definition is duplicated and then shows where the first definition was.
> > OTOH first one was almost for sure from the proper first include so
> > maybe we don't care. Let me drop this.
> 
> FWIW, if we want to simplify our header guards, we could replace the
> 
>   #ifndef FOO_H
>   #define FOO_H
> 
>   ....
> 
>   #endif /* FOO_H */
> 
> with merely
> 
>   #pragma once
> 
> at the top of each header.
> 
> With regards,
> Daniel

Will break this trick, won't it?

-- 
MST


