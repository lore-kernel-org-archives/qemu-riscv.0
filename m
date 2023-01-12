Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFywx-00075T-PY
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 09:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFywv-00073x-MZ
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 09:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFywu-0005jz-1D
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 09:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673535179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Orpw9Mzjk/P1UNMXU9A1/QjjTSyb08eqlI5WuROrZFA=;
 b=Hl5ASamqWjSmLC4zWtIb7CnVVhDD14fwVD2WVPkec2S2AzBB2SENWyCpFPVAp7XG+CKFq5
 4jO/QfvdM1gCCVsgAu1HbsceScZqDVI2n6pIcNzvUp83L49SL/+MxGbRgkCY9AMIO3JgWF
 hiRWPr1ZU3kG62urgpZzb27r6XgEED4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-ml0PJfCFNLS_57WecqpE6A-1; Thu, 12 Jan 2023 09:52:54 -0500
X-MC-Unique: ml0PJfCFNLS_57WecqpE6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1856C1C08980;
 Thu, 12 Jan 2023 14:52:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CBBC15BA0;
 Thu, 12 Jan 2023 14:52:50 +0000 (UTC)
Date: Thu, 12 Jan 2023 14:52:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <Y8AewFAHRGf6ZI3x@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112082537-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-List-Received-Date: Thu, 12 Jan 2023 14:53:01 -0000

On Thu, Jan 12, 2023 at 08:51:26AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > docs/devel/style.rst mandates:
> > 
> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> >     the behavior of core system headers like <stdint.h>.  It must be
> >     the first include so that core system headers included by external
> >     libraries get the preprocessor macros that QEMU depends on.
> > 
> >     Do not include "qemu/osdep.h" from header files since the .c file
> >     will have already included it.
> > 
> > A few violations have crept in.  Fix them.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> With my awesome grep skillz I found one more:
> $ grep -r --include='*.h' qemu/osdep.h
> include/block/graph-lock.h:#include "qemu/osdep.h"
> 
> Looks like all C files must include qemu/osdep.h, no?

Yes, and IMHO that is/was a mistake, as it means our other header
files are not self-contained, which prevents developer tools from
reporting useful bugs when you're editting.

For example, if you have clangd integrated into your editor, it will
warn you as you're editting if you've referenced a function / type
that doesn't exist in the file, or anything it includes. This is made
completely useless for QEMU .h files though, as they're all incomplete,
only the .c files have the full headers.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


