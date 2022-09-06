Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVW1W-0002gv-4M
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 06:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW1T-0002ZX-QV
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 06:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW1S-0001DC-Ak
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 06:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662460897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuL+cCFEWKfTQ5JgfGgEls+NkRLchxm1H06+O6Y9F9c=;
 b=d1Url5JwxqRAK6qwhWsV3fQmY1kdsGXuqcgwiLMaTjGCfomxVRYOGfCvDmdnch1+a7RbUD
 I/YmyB7scl9L6JbixzyLFyMMqiEk3ctngcfx/UcEjfpfmlTYOr7hG6GKQ3iyYSuMrpvfEG
 e0MJUibmDu5/zTkswsp5d+U6QoEuSc4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-2lg3nmUUMFq8UTO1QH9tUw-1; Tue, 06 Sep 2022 06:41:31 -0400
X-MC-Unique: 2lg3nmUUMFq8UTO1QH9tUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74BE3C01DFC;
 Tue,  6 Sep 2022 10:41:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623C8C15BBD;
 Tue,  6 Sep 2022 10:41:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B24391800629; Tue,  6 Sep 2022 12:41:28 +0200 (CEST)
Date: Tue, 6 Sep 2022 12:41:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906090219.412517-1-sunilvl@ventanamicro.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 06 Sep 2022 10:41:40 -0000

  Hi,

> 3)Make the EDK2 image size to match with what qemu flash expects
> truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

Hmm, we have that kind of padding on arm too (64M for code and 64M for
vars) and only a fraction of the space is actually used, which isn't
exactly ideal.  So not sure it is a good plan to repeat that on riscv.

Also: Do you have support for persistent efi variables?  If that is the
case then it makes sense to have separate pflash devices for code and
variable store.  First because you can map the code part read-only then,
and second because decoupling code + vars to separate files allows easy
firmware code updates without loosing the variable store.

take care,
  Gerd


