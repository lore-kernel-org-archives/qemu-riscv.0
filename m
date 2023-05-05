Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puyJ2-0006St-SV
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 12:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puy7Q-0002g6-FG
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 12:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puy7O-0008Rq-Kq
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 12:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683303433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wGr64MThf8eyQJ6hvxFtE5QioFd//XUYDgkdlAcvB8=;
 b=C8RXOCNb3+iS8ZaMNLQiX5Gv4qUSLU07rAS1R277CFZE32mu0JfkY0KrzpkPDxFtts02vK
 hDWimmZpsV5wvpFwYN6KDUvrweZSgWIgAe3ZtzAPXgnK/eZbPQRTP7gDnNUKHYSJVoXuqh
 jw8u9nBV5tn8lkj2sQv4p6Oyo75BTE4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-LV5YCGX4M1y_q4lPQSNv9Q-1; Fri, 05 May 2023 12:17:11 -0400
X-MC-Unique: LV5YCGX4M1y_q4lPQSNv9Q-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-32afe238257so12136495ab.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 09:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683303431; x=1685895431;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7wGr64MThf8eyQJ6hvxFtE5QioFd//XUYDgkdlAcvB8=;
 b=lHnWeU9lalEYiltgXnadLWEj5e1mh1TZtuZbgsFPe3bpl2Az0PR5n5PYEyKtbOFaik
 Yrdxtl9ygLPlaVeFk0ZJ5qoTuISJ8dIsjLvzEMthHP57PMJ9Jc7GhAvGHrLdPH40w9hW
 KGFZ8UH+hu1h7eBJQoFJ9MFSo4p+Jz0KaareyxKQT0wq2UPnLluS6PMkLbDegYOLY3wo
 QfU8wVzagreUz/rIQwcZ3wqt0GdRpt/JxkL9ZmNTUNhcLRkBPoSrMFgEmmOucL7Ti9K1
 3VNWWRR0aPEXFMGNipcZDEIuHMGP+k49Rk7pvxM7rCA4pqDVDGdOAC3jam2Yw0Nj4P7o
 e9pQ==
X-Gm-Message-State: AC+VfDzSfwd+hZc7W6GWeDClQz7eWYcdK0bG7ZqCIzZDajnHO/bU8/h9
 9LKgHG3OcoEr2nktKdxZvpwT2SV5cPyPPx+kfOysMgwmpF+l2N5u8qp0kUpZBl76qZKbyvyJtWu
 zAfm+9XCq5v18yWI=
X-Received: by 2002:a92:c08b:0:b0:329:5a6e:3a18 with SMTP id
 h11-20020a92c08b000000b003295a6e3a18mr1168464ile.4.1683303430842; 
 Fri, 05 May 2023 09:17:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P3fZICW/H7ZI6jk+krVPYZW3rGKDqjPiM4OgrXBjyIlB77r7wTQCObHECwSWiwZY3F2YOdA==
X-Received: by 2002:a92:c08b:0:b0:329:5a6e:3a18 with SMTP id
 h11-20020a92c08b000000b003295a6e3a18mr1168442ile.4.1683303430588; 
 Fri, 05 May 2023 09:17:10 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f11-20020a6b510b000000b0076140f7918dsm30372iob.49.2023.05.05.09.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:17:09 -0700 (PDT)
Date: Fri, 5 May 2023 10:17:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>, Thomas Huth
 <thuth@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PTACH v2 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support
Message-ID: <20230505101707.495251a2.alex.williamson@redhat.com>
In-Reply-To: <20230505113946.23433-2-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-2-yongxuan.wang@sifive.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 12:29:15 -0400
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
X-List-Received-Date: Fri, 05 May 2023 16:17:17 -0000

On Fri,  5 May 2023 11:39:36 +0000
Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:

> Update the linux headers to get the latest KVM RISC-V headers with AIA support
> by the scripts/update-linux-headers.sh.
> The linux headers is comes from the riscv_aia_v1 branch available at
> https://github.com/avpatel/linux.git. It hasn't merged into the mainline kernel.

Updating linux-headers outside of code accepted to mainline gets a down
vote from me.  This sets a poor precedent and can potentially lead to
complicated compatibility issues.  Thanks,

Alex


