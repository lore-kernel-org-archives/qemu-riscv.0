Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbpGl-00048F-7S
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 14:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpGh-00047G-LG
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 14:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpGa-0004ke-Je
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 14:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619635831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdftgPLvqAZa8yZOa1exDBS2uHHiczkANDH6pZNS3v8=;
 b=QvH2H0mXrZErTxUMTk5pLMG0JZInNxGUbUQB+N9duZ7nm012yNjRhJ1x+uSRdSnO6eTyL9
 xdQ+43IhnRjPs4W5xa45uWgf+oq6OIqdLvazOH/cWtruS1kkc3WK+P+fiJpZPdelgswzCK
 BAI5Us7OlAd56ZixvNDiBZ+o/vwnkTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-mdIQqgVHPKK8Fbe-Rsyuzg-1; Wed, 28 Apr 2021 14:50:29 -0400
X-MC-Unique: mdIQqgVHPKK8Fbe-Rsyuzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118F3501EC;
 Wed, 28 Apr 2021 18:50:28 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D17E5D9C0;
 Wed, 28 Apr 2021 18:50:20 +0000 (UTC)
Date: Wed, 28 Apr 2021 14:50:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
Message-ID: <20210428185019.apliuz32xxx54sze@habkost.net>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Apr 2021 18:50:39 -0000

On Mon, Apr 26, 2021 at 09:35:18PM +0200, Philippe Mathieu-Daudé wrote:
> Beside the loongson3-virt machine (MIPS), the following machines
> also use the fw_cfg device:
> 
> - ARM: virt & sbsa-ref
> - HPPA: generic machine
> - X86: ACPI based (pc & microvm)
> - PPC64: various
> - SPARC: sun4m & sun4u
> 
> Add their FW_CFG Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Eduardo Habkost <ehabkost@redhat.com> (i386)

-- 
Eduardo


