Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJKgH-00076w-LC
	for mharc-qemu-riscv@gnu.org; Fri, 18 Sep 2020 14:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKgF-00075k-RS
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2020 14:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKgD-0002Fb-9Q
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2020 14:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600452016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3F1x7MczDYTNGGFx+fYd5czEPRA32ArBkr30TvxIgkg=;
 b=ZcVuGkGJ69cl6IDg22Tcs+SqoFYe3g21ctl0T6NnVgjRGdhndFq3VmwR8QZxbwOLDPQlJ/
 OHH0tsWcvzBqxRMk5zBwkf4ZNCXx9rcYiCIsx1xztUy3Yns9yHP3BnEzTlYFF1O6P/6+NC
 7sDxgjnj6DqVvaWPGxORpDEUNmS0m/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-jDN9dpt8M3KLZjv8TqPZjQ-1; Fri, 18 Sep 2020 14:00:13 -0400
X-MC-Unique: jDN9dpt8M3KLZjv8TqPZjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FAD192CC46;
 Fri, 18 Sep 2020 18:00:11 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86F635D9D5;
 Fri, 18 Sep 2020 18:00:07 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:00:06 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 0/6] qom: Allow object to be aligned
Message-ID: <20200918180006.GC7594@habkost.net>
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200916004638.2444147-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 18 Sep 2020 18:00:20 -0000

On Tue, Sep 15, 2020 at 05:46:32PM -0700, Richard Henderson wrote:
> I've seen some failures on arm and s390x hosts after
> enabling host vector support.  It turns out that the
> malloc for these hosts does not provide 16-byte alignment.
> 
> We already have a function that can alloc with alignment,
> but we need to pass this down from the structure.  We also
> don't want to use this function unconditionally, because
> the windows version does page allocation, which would be
> overkill for the vast majority of the objects allocated.

I'm queueing patches 2-6.  Thanks!

-- 
Eduardo


