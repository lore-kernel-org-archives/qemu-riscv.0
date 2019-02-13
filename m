Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwj5-0002G2-7O
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj3-0002Ay-3j
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj0-0006y8-Mv
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwiy-0006oW-LK
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:26 -0500
Received: by mail-pg1-x542.google.com with SMTP id g189so1301143pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=BophRMwowisaYaC1U48VeLPl6f830QgtoDxDV4XkaXM=;
	b=iIUsRiskzYV2GBY+HhpAeOdyOINwilUB7oRUyCDd59nAm72ch1yUIxxgDz4bh2S1DM
	RdWUjZ3bBpoKeLENm5OqQWg/jKSp5seyaVZfKTOhS56Eb0gFgWZYBP3R+gKF1Xw0gTrQ
	i5y8/N6bb3bc0RwnNGmjrEVV0fLVddxfbW8gYQerh+RxQy0F4MAKjtsIrS4l/+iSCJ2e
	9nJi+0I3JIYa3ntFpuQ34tLiBYCUQFAPqnrSBRfi2+l7dnMb5PZo8UflijgoRgpLQEFo
	rSaYb805qM6W0+jXl5EetLGr10PwHN6SnOk3gOUh7UKPEaGpSIPVA0ind65mB/a4JJMa
	nD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=BophRMwowisaYaC1U48VeLPl6f830QgtoDxDV4XkaXM=;
	b=Xvybs7p5ZvYgpk9Sm1FwamjL7Hck7Ze/JkPPvEL8HXxip1a7mVm7rtFUc3hXEisHbp
	UHsIEivAAiApCSA37g+ktWZUVxff59xylFttC2MtkwD2/1ecRfzdHBPalqjAa4xpfp9d
	S7R7CAzh4wqppCToErdo+fndnHZvNduFBVSZS+1ZUeaMpyPk8q84T8YOZIUApwJwCxDg
	hS+5e/F13UlaVJhkAjJzFlU1+JF/X0BfSjPqoAEStGugOnN+N+QW5oMHJVSoWdpO6k4N
	aohJhyfi0eWYPFZOhSGXl4V70cizXjUV+zAAkMPj3nxUe7yiF7WxuBOGyyKfJjysAPih
	OVpA==
X-Gm-Message-State: AHQUAua0zfdcNb+XMt2MgyiVclLmtPGzL67NJwfjh/lpsFfFAq+SW/4Y
	ViX9bfP0aIFokyZo6VZAgXojRQsoz0w=
X-Google-Smtp-Source: AHgI3Iax+llcgeGzvFhQI4b8sx4SrWyWdkMVlsl0lXwqFz9lL7sy+vZUFG9RnHhsaP4iGcYJe/+L/Q==
X-Received: by 2002:a63:125a:: with SMTP id 26mr1043383pgs.314.1550072721042; 
	Wed, 13 Feb 2019 07:45:21 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v26sm4782101pfg.62.2019.02.13.07.45.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:20 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:50 -0800
Message-Id: <20190213154450.14749-12-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PULL 11/11] riscv: Ensure the kernel start address is
 correctly cast
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:45:30 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Cast the kernel start address to the target bit length.

This ensures that we calculate the initrd offset to a valid address for
the architecture.

Steps to reproduce the original problem (reported by Alex):
  Build U-Boot for the virt machine for riscv32. Then run it with

    $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file>

  You can find the initrd address with

    U-Boot# fdt addr $fdtcontroladdr
    U-Boot# fdt ls /chosen

  Then take a peek at that address:

    U-Boot# md.b <addr>

  and you will see that there is nothing there without this patch. The
  reason is that the binary was loaded to a negative address.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Alexander Graf <agraf@suse.de>
Reported-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e.c | 2 +-
 hw/riscv/sifive_u.c | 2 +-
 hw/riscv/spike.c    | 2 +-
 hw/riscv/virt.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index bfc086609cb9..b1cd11363c93 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -74,7 +74,7 @@ static const struct MemmapEntry {
     [SIFIVE_E_DTIM] =     { 0x80000000,     0x4000 }
 };
 
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2730b25b6032..7bc25820feaa 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -65,7 +65,7 @@ static const struct MemmapEntry {
 
 #define GEM_REVISION        0x10070109
 
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
 
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c66ffc50cc74..2a000a58009a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -53,7 +53,7 @@ static const struct MemmapEntry {
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
 
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e8b19c66898..fc4c6b306e13 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -62,7 +62,7 @@ static const struct MemmapEntry {
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
 };
 
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
 
-- 
2.18.1


