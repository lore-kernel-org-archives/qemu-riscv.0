Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMLbM-0000cG-7V
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 23:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLb1-0000aQ-RR
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 23:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLb0-0001i6-0H
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 23:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=cV5SeJkREFK4X57Rm+lPSis76DLZ/guPZ6FdIGmyaytOpEhaf1jsBswFpzsFfPhTZTEfPg
 p+OxbjlYI2Po004UUwl1ue/rrQfYvEb8z0YySsRCPOOTFc/T8vhPtQ0HZhPzmqO34a9Bar
 x0QbBoexplHqFdl3ZaB08K4K9EYvD50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-AP3h7JcBPP2Q2JQNwEM_Lw-1; Sun, 29 Jan 2023 23:16:40 -0500
X-MC-Unique: AP3h7JcBPP2Q2JQNwEM_Lw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003db0cb8e543so3769815wmi.3
 for <qemu-riscv@nongnu.org>; Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=Aqlr1v4kQH1+SPniH0fC6yI3Ga7/CTKtSiXCYKkiAlGH5MWmKsCJ/zAisKgumghl+J
 8SH4aFX610h7M6KUgM46jiy7wfFmxrVMlmz9Xtn7a9JIGygO3D0rcct0rwA8R+rXQr9X
 SNktwb91nR7sfNmJDnZ8ERg9ILYcih4jNluE0E+8KrvDsXtmCCMF28gb3Ji+OMqr3wFD
 GtHewu75G2SE+br34/Fqe/gJfU0denaXj+125+XrErrfWSLW9IzLkNEJAWA6Ixag9PYM
 l+xDqz1f/p+5E+9Le+7e9drkKC/RuQv0+HsjAo2HTNtXYfEwMB5yPWOK6uy/xX/oawYc
 4jFg==
X-Gm-Message-State: AO0yUKVKkxRXczsN/AL6Y5PYZWsJXEZ+MfYjsZ2jTCCN5OfEUOYFiSQt
 S27SZjpSrV/Fsa4wsmp3lOxu+2/MXvdm9/zLu3fHVHEL49l/LVV2zGAR+ecFSF3g7K4drAxb5Im
 sSn2p4dBPCF04ycI=
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048247wml.35.1675052199093; 
 Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/NuJm0/GGFcSWLl2wNg3skVv07Dwu7LNXy9+q+i4AjVPh3KV/Q5F/R/gsH9xGlHqFeji8eAg==
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048227wml.35.1675052198873; 
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c26d300b003dc50c38921sm4586064wmv.35.2023.01.29.20.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 19/19] Drop duplicate #include
In-Reply-To: <20230119065959.3104012-20-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:59 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-20-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 30 Jan 2023 05:16:37 +0100
Message-ID: <87357spsgq.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-List-Received-Date: Mon, 30 Jan 2023 04:17:01 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Tracked down with the help of scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..8b7d1af75d 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/rcu.h"
>  #include "qemu/madvise.h"
>  #include "exec/target_page.h"
>  #include "migration.h"
> @@ -34,7 +33,6 @@
>  #include "hw/boards.h"
>  #include "exec/ramblock.h"
>  #include "socket.h"
> -#include "qemu-file.h"
>  #include "yank_functions.h"
>  #include "tls.h"

Ouch

Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't want to look into the logs.  They *could* say that it was me the
one doing the mess.


