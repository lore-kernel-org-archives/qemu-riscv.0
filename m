Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noOrb-0001C5-Qm
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 08:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1noOra-000188-CP
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 08:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1noOrY-0006Lv-0N
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 08:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652185271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iko0h5mlGebfhao3jeBrN4iOcqM/nCep3wZfEOD/bgE=;
 b=Xu2Ep716t0vs7u0H1y72RL8yyQbC+Sv74OmBMyd2MyJqfDGfy1dVqRY7K1+0iEbC2Rn9am
 8C6uymu6qAKfejDbR2D1u/iwV9ciylHiA+JEnFPLlmsJfEpytwyhbUjPJmzFPzud7NhvIS
 20GqS6ivueskQUokNec9DlyiHJdar3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-P3lMRYo-MrWr8OM2jkFAfw-1; Tue, 10 May 2022 08:21:06 -0400
X-MC-Unique: P3lMRYo-MrWr8OM2jkFAfw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91BDE293249A;
 Tue, 10 May 2022 12:21:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CEE43EC24;
 Tue, 10 May 2022 12:21:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5717E18000A3; Tue, 10 May 2022 14:20:56 +0200 (CEST)
Date: Tue, 10 May 2022 14:20:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 mopsfelder@gmail.com, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-RISC-V <qemu-riscv@nongnu.org>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
Message-ID: <20220510122056.l6deselsfipofnct@sirius.home.kraxel.org>
References: <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm>
 <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 12:21:14 -0000

  Hi,

> I'm not very familiar with KVM on ARM - but is it possible to use KVM there
> with an arbitrary machine? If that's the case, a user might want to use KVM
> on their 64-bit host to run a 32-bit guest machine, and then you need to
> keep the 32-bit machines in the -aarch64 binary.

32-bit guest is 'qemu-system-aarch64 -machine virt -cpu host,aarch64=off'
(and a aarch64 CPU which actually supports the armv7 instructions).

take care,
  Gerd


