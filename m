Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQXdp-0001GY-Kd
	for mharc-qemu-riscv@gnu.org; Thu, 08 Oct 2020 11:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQXdn-0001Fp-Lg
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 11:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQXdf-0005Z4-JK
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 11:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602170126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsTxGd52RpL1Rni+Ium1WEhbiIOmWYcR8IimClkGF6I=;
 b=KrZ02n2x4/cxPS5SJk4eYhrGLo72JEazkw2ZWiG39ZZ5ueZR5kCM0CzvKfsETAFHPcTraK
 v0DS0jmudv1kTfrZ7PIsIyuYBKN6Qwy1o1LIfmSAFbzsh6hZtFOZUrzVlTwiSEl8ZXwK91
 NBM0SCBvHvOoTlGW7i1brVns1wXtkas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-CraWXUl-OCKPyA_r2ZyarA-1; Thu, 08 Oct 2020 11:15:24 -0400
X-MC-Unique: CraWXUl-OCKPyA_r2ZyarA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B976E427C4;
 Thu,  8 Oct 2020 15:15:22 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 651FD5D9D5;
 Thu,  8 Oct 2020 15:15:22 +0000 (UTC)
Date: Thu, 8 Oct 2020 11:15:21 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: Purpose of QOM properties registered at realize time?
Message-ID: <20201008151521.GB7303@habkost.net>
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mu0xyrtn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 08 Oct 2020 15:15:35 -0000

On Thu, Oct 08, 2020 at 11:45:08AM +0200, Markus Armbruster wrote:
> A first class static array property, where the size of the array is part
> of the value could perhaps cover this case.

This is an interesting idea, I think we should explore that.

qdev_pass_gpios() would become unnecessary and could be replaced
by a single (static) alias property.

-- 
Eduardo


